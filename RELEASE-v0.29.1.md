# Viso Player 0.29.1

Current USB image: **`viso-player-0.29.1.iso`**. Machines already on **0.24.0**, **0.25.0**, **0.26.0**, **0.26.1**, **0.27.0**, **0.27.1**, **0.28.0**, or **0.29.0** can apply this build from **Device → Updates**. Versions before 0.24.0 still need a USB install (see [v0.24.0](https://github.com/zabelez/viso-player-releases/releases/tag/v0.24.0)).

## What is fixed

- **Lowest quality.** A display set to lowest bandwidth decodes the small picture and puts it on the screen. The picture keeps moving. Audio no longer continues alone on the last high-quality frame.
- **Back to highest.** Choosing highest again shows the full picture and keeps it moving.

## What you should see after installing

1. Write **`viso-player-0.29.1.iso`** (Balena Etcher, or Rufus in **DD Image** mode). Boot from USB.
2. A 15-second menu appears. If you do nothing, **Try** starts. To keep the player, choose **Install**, let it finish, and **remove the USB** when asked.
3. Displays start black — press **SPACE** for the address. Open `https://<IP>`, accept the certificate warning, and set the operator password.
4. On a display, choose lowest bandwidth. The picture becomes the small rendition and keeps moving. Choose highest again and the full picture comes back.

## Already on 0.24.0 through 0.29.0

Open **Device → Updates**, check, and apply **0.29.1**. You do not need to reinstall from USB unless you prefer a clean install.

## Downloads

| File | Purpose |
|------|---------|
| `viso-player-0.29.1.iso` | Try or Install. **Install erases the target disk.** |
| `viso-player-0.29.1.iso.sha256` | Verify the image |
| `viso-player-0.29.1.tar.gz` | In-place update for machines already on **0.24.0** through **0.29.0**. |
| `viso-player-0.29.1.tar.gz.sha256` | Verify the update package |
| `latest.json` / `latest.json.sig` | Signed update manifest for **Device → Updates**. |

| File | SHA-256 |
|------|---------|
| `viso-player-0.29.1.iso` | `343a70f9a183db197ad0e4a2ffd092f73081454c41f40b364c16b5c004be9ab5` |
| `viso-player-0.29.1.tar.gz` | `339b78a5b1ff191c24299f9228091a5055a6b9b8f66bad5838ad961c3475e32c` |
