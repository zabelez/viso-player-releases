#!/usr/bin/env bash
# Publish Viso Player 0.27.1 to zabelez/viso-player-releases.
#
#   bash publish-v0.27.1.sh --fill-hashes   # write SHA-256 into RELEASE-v0.27.1.md, no upload
#   bash publish-v0.27.1.sh                 # verify, commit docs, push, gh release create
#   ART=<dir>  artifacts dir (ISO + ota/), default ../dist/0.27.1
#
# DO NOT RUN without the operator's explicit OK.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
VER=0.27.1
ART="${ART:-$ROOT/../dist/$VER}"
SRC="${SRC:-$ROOT/../native-v0}"
ISO="$ART"
OTA="$ART/ota"
NOTES="$ROOT/RELEASE-v$VER.md"

FILES=(
  "$ISO/viso-player-$VER.iso"
  "$ISO/viso-player-$VER.iso.sha256"
  "$OTA/latest.json"
  "$OTA/latest.json.sig"
  "$OTA/viso-player-$VER.tar.gz"
  "$OTA/viso-player-$VER.tar.gz.sha256"
)
for f in "${FILES[@]}" "$NOTES" "$SRC/config/update.pub"; do
  [[ -f "$f" ]] || { echo "Missing: $f" >&2; exit 1; }
done

(cd "$ISO" && shasum -a 256 -c "viso-player-$VER.iso.sha256")
(cd "$OTA" && shasum -a 256 -c "viso-player-$VER.tar.gz.sha256")
python3 - "$SRC" "$OTA" "$VER" <<'EOF'
import sys
from pathlib import Path
src, ota, ver = sys.argv[1:]
sys.path.insert(0, str(Path(src) / "web"))
import updates_crypto as uc
ota = Path(ota)
res = uc.verify_manifest((Path(src) / "config/update.pub").read_text(), (ota / "latest.json").read_bytes(),
                         (ota / "latest.json.sig").read_bytes())
c = res["claims"] or {}
pkg = ota / f"viso-player-{ver}.tar.gz"
if not res["ok"] or c.get("version") != ver or c.get("min_from") != "0.24.0" \
        or c.get("sha256") != uc.sha256_file(str(pkg)) or int(c.get("size") or 0) != pkg.stat().st_size:
    sys.exit(f"latest.json does not match the package or the production key: {res}")
print(f"latest.json verified: {ver}, min_from {c['min_from']}")
EOF

ISO_SHA=$(awk '{print tolower($1)}' "$ISO/viso-player-$VER.iso.sha256")
OTA_SHA=$(awk '{print tolower($1)}' "$OTA/viso-player-$VER.tar.gz.sha256")

if [[ "${1:-}" == "--fill-hashes" ]]; then
  python3 - "$NOTES" "viso-player-$VER.iso" "$ISO_SHA" "viso-player-$VER.tar.gz" "$OTA_SHA" <<'EOF'
import re, sys
path, *pairs = sys.argv[1:]
text = open(path, encoding="utf-8").read()
for name, digest in zip(pairs[::2], pairs[1::2]):
    pat = re.compile(r"(\| `" + re.escape(name) + r"` \| `)[0-9a-fA-FPENDIG]+(` \|)")
    text, n = pat.subn(lambda m: m.group(1) + digest + m.group(2), text)
    if n != 1:
        sys.exit(f"{name}: expected one SHA row in {path}, found {n}")
open(path, "w", encoding="utf-8").write(text)
EOF
  echo "viso-player-$VER.iso     $ISO_SHA"
  echo "viso-player-$VER.tar.gz  $OTA_SHA"
  echo "Hashes written to $NOTES. Review, then run without --fill-hashes."
  exit 0
fi

grep -q "$ISO_SHA" "$NOTES" && grep -q "$OTA_SHA" "$NOTES" || {
  echo "$NOTES does not list the current SHA-256: bash $0 --fill-hashes" >&2
  exit 1
}

if ! gh auth status >/dev/null 2>&1; then
  echo "Run: gh auth login -h github.com -s repo" >&2
  exit 1
fi

cd "$ROOT"
git add README.md "RELEASE-v$VER.md" "publish-v$VER.sh"
if git diff --cached --quiet; then
  echo "README / RELEASE already committed"
else
  git -c user.name="zabelez" -c user.email="contact@sysontech.com" commit -m "$(cat <<'EOF'
Publish Viso Player 0.27.1 public README and release notes.

Transport on Viso Communication: Automatic, UDP, or TCP.
TCP needs Gateway 0.5.0. OTA from 0.24.0 through 0.27.0.
EOF
)"
fi
git push origin main

gh release create "v$VER" "${FILES[@]}" \
  --repo zabelez/viso-player-releases \
  --title "$VER" \
  --notes-file "$NOTES"

echo "Published: https://github.com/zabelez/viso-player-releases/releases/tag/v$VER"
