# Viso Player 0.29.4

Current USB image: **`viso-player-0.29.4.iso`**. Machines already on **0.24.0**, **0.25.0**, **0.26.0**, **0.26.1**, **0.27.0**, **0.27.1**, **0.28.0**, **0.29.0**, **0.29.1**, **0.29.2**, or **0.29.3** can apply this build from **Device → Updates**. Versions before 0.24.0 still need a USB install (see [v0.24.0](https://github.com/zabelez/viso-player-releases/releases/tag/v0.24.0)).

## What is fixed

- **The stream uses the quality you chose.** A source that is already on a display is no longer reduced to 720p and a software encoder. 720p, 1080p, 4K, and Custom keep the resolution, frame rate, bitrate, and codec on the card. Automatic still tries the GPU encoder first. If that encoder cannot open, software encode keeps the same resolution.
- **YouTube sees one picture per frame.** Each picture is stamped on the frame interval of the rate you chose. A machine that delivers frames a little late no longer makes the platform read the upload as more video than the seconds that passed. Audio is counted from the samples that were captured, on the same clock as the picture.

Stream setups, recording jobs, and the files under `/var/lib/viso-player/recordings` stay on the machine.

## What you should see after installing

1. Write **`viso-player-0.29.4.iso`** (Balena Etcher, or Rufus in **DD Image** mode). Boot from USB.
2. A 15-second menu appears. If you do nothing, **Try** starts. To keep the player, choose **Install**, let it finish, and **remove the USB** when asked.
3. Displays start black — press **SPACE** for the address. Open `https://<IP>`, accept the certificate warning, and set the operator password.
4. **Streams.** Choose 1080p, or the quality you want, then Start. The card’s encoder matches that choice. On YouTube, stream health should no longer say the encoder is sending faster than real time because the picture clock ran ahead.

## Already on 0.24.0 through 0.29.3

Open **Device → Updates**, check, and apply **0.29.4**. You do not need to reinstall from USB unless you prefer a clean install.

## Downloads

| File | Purpose |
|------|---------|
| `viso-player-0.29.4.iso` | Try or Install. **Install erases the target disk.** |
| `viso-player-0.29.4.iso.sha256` | Verify the image |
| `viso-player-0.29.4.tar.gz` | In-place update for machines already on **0.24.0** through **0.29.3**. |
| `viso-player-0.29.4.tar.gz.sha256` | Verify the update package |
| `latest.json` / `latest.json.sig` | Signed update manifest for **Device → Updates**. |

| File | SHA-256 |
|------|---------|
| `viso-player-0.29.4.iso` | `7a10856cf0190fb607dcce26573eebfe24d8d9e6c792fe0af2b55e4ce3c18cd0` |
| `viso-player-0.29.4.tar.gz` | `124a4b4f6475c54b90cdb231afa3ee458c219339616641660d88b09413e6bacc` |
