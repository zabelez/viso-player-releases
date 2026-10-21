# Viso Player 0.29.3

Current USB image: **`viso-player-0.29.3.iso`**. Machines already on **0.24.0**, **0.25.0**, **0.26.0**, **0.26.1**, **0.27.0**, **0.27.1**, **0.28.0**, **0.29.0**, **0.29.1**, or **0.29.2** can apply this build from **Device → Updates**. Versions before 0.24.0 still need a USB install (see [v0.24.0](https://github.com/zabelez/viso-player-releases/releases/tag/v0.24.0)).

## What is fixed

- **Recorded picture and sound stay together.** A recording stamps video and audio from the source clock. A signal running at 29.97 fps that was announced as 29 fps no longer drifts by about one second every half minute. This applies to every quality profile, and to both inputs and Viso streams.
- **A skipped picture stays a gap.** If the recorder misses a frame, that gap is in the video timeline. The audio keeps its own clock instead of being squeezed to match.

Files recorded before this update are unchanged.

## What you should see after installing

1. Write **`viso-player-0.29.3.iso`** (Balena Etcher, or Rufus in **DD Image** mode). Boot from USB.
2. A 15-second menu appears. If you do nothing, **Try** starts. To keep the player, choose **Install**, let it finish, and **remove the USB** when asked.
3. Displays start black — press **SPACE** for the address. Open `https://<IP>`, accept the certificate warning, and set the operator password.
4. Record a Viso stream for a few minutes, then play the file. Picture and sound still match at the end.

## Already on 0.24.0 through 0.29.2

Open **Device → Updates**, check, and apply **0.29.3**. You do not need to reinstall from USB unless you prefer a clean install.

## Downloads

| File | Purpose |
|------|---------|
| `viso-player-0.29.3.iso` | Try or Install. **Install erases the target disk.** |
| `viso-player-0.29.3.iso.sha256` | Verify the image |
| `viso-player-0.29.3.tar.gz` | In-place update for machines already on **0.24.0** through **0.29.2**. |
| `viso-player-0.29.3.tar.gz.sha256` | Verify the update package |
| `latest.json` / `latest.json.sig` | Signed update manifest for **Device → Updates**. |

| File | SHA-256 |
|------|---------|
| `viso-player-0.29.3.iso` | `1547dd88d2ad38e821c00a21a5221cb5e103075a84ebd759bd59c39981096289` |
| `viso-player-0.29.3.tar.gz` | `ff3ab2426bcc82ec68853378e68f42f883d3ae5c63703454f34f77da5263ce32` |
