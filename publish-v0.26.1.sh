#!/usr/bin/env bash
# Publish Viso Player 0.26.1 to zabelez/viso-player-releases.
#
#   bash publish-v0.26.1.sh --fill-hashes   # write SHA-256 into RELEASE-v0.26.1.md, no upload
#   bash publish-v0.26.1.sh                 # verify, commit docs, push, gh release create
#
# DO NOT RUN without the operator's explicit OK.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
VER=0.26.1
ART="$ROOT/../dist"
[[ -f "$ART/iso/viso-player-$VER.iso" ]] || ART="/Volumes/Sabele Barbosa/Projects/viso/projects/viso-player/dist"
ISO="$ART/iso"
OTA="$ART/updates-$VER"
NOTES="$ROOT/RELEASE-v$VER.md"

FILES=(
  "$ISO/viso-player-$VER.iso"
  "$ISO/viso-player-$VER.iso.sha256"
  "$OTA/latest.json"
  "$OTA/latest.json.sig"
  "$OTA/viso-player-$VER.tar.gz"
  "$OTA/viso-player-$VER.tar.gz.sha256"
)
for f in "${FILES[@]}" "$NOTES"; do
  [[ -f "$f" ]] || { echo "Missing: $f" >&2; exit 1; }
done

(cd "$ISO" && shasum -a 256 -c "viso-player-$VER.iso.sha256")
(cd "$OTA" && shasum -a 256 -c "viso-player-$VER.tar.gz.sha256")

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
Publish Viso Player 0.26.1 public README and release notes.

Fix release: players in other rooms and departments get picture and sound
with Viso Gateway 0.3.1. OTA from 0.24.0, 0.25.0, and 0.26.0.
EOF
)"
fi
git push origin main

gh release create "v$VER" "${FILES[@]}" \
  --repo zabelez/viso-player-releases \
  --title "$VER" \
  --notes-file "$NOTES"

echo "Published: https://github.com/zabelez/viso-player-releases/releases/tag/v$VER"
