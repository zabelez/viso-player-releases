# Viso Player 0.25.0

Current USB image: **`viso-player-0.25.0.iso`**. Machines already on **0.24.0** can apply this build from **Device → Updates**. Versions before 0.24.0 still need a USB install (see [v0.24.0](https://github.com/zabelez/viso-player-releases/releases/tag/v0.24.0)).

## What is new

- **No 1080p60 ceiling.** The picture size is **min(what the player asks, the source, the encoder)**. If the source and the room allow it, the encode can go above 1080p60.
- **Highest / Lowest match the wire.** **Highest** asks for the source’s full picture. **Lowest** asks for the 640-wide proxy (L). The player tells the sender which HDMI mode is on the screen, so the fit stays consistent.
- **Auto output mode** uses the best mode this computer can apply on that monitor — not a wishlist from the EDID alone.

## Update Viso Gateway too

**This Player needs [Viso Gateway 0.2.0](https://github.com/zabelez/viso-gateway-releases/releases/tag/v0.2.0) (or later).** Player and Gateway share the same size / frame-rate / bitrate fit. An older Gateway (0.1.0) will not negotiate correctly with 0.25.0 — replace the Gateway apps on the Mac before you rely on this player in a room.

Download Gateway, Gateway NDI, and Gateway Screen from [viso-gateway-releases](https://github.com/zabelez/viso-gateway-releases/releases/tag/v0.2.0).

## What you should see after installing

1. Write **`viso-player-0.25.0.iso`** (Balena Etcher, or Rufus in **DD Image** mode). Boot from USB.
2. A 15-second menu appears. If you do nothing, **Try** starts. To keep the player, choose **Install**, let it finish, and **remove the USB** when asked.
3. Displays start black — press **SPACE** for the address. Open `https://<IP>`, accept the certificate warning, and set the operator password.
4. **Device → License** — email **contact@sysontech.com** with the Device UUID, paste the token, Activate.
5. **Displays** — pick a Viso source for each screen.

## Already on 0.24.0

Open **Device → Updates**, check, and apply **0.25.0**. You do not need to reinstall from USB unless you prefer a clean install. Update the Gateway Macs to **0.2.0** at the same time.

## Downloads

| File | Purpose |
|------|---------|
| `viso-player-0.25.0.iso` | Try or Install. **Install erases the target disk.** |
| `viso-player-0.25.0.iso.sha256` | Verify the image |
| `viso-player-0.25.0.tar.gz` | In-place update for machines already on **0.24.0**. |
| `viso-player-0.25.0.tar.gz.sha256` | Verify the update package |
| `latest.json` / `latest.json.sig` | Signed update manifest for **Device → Updates**. |

| File | SHA-256 |
|------|---------|
| `viso-player-0.25.0.iso` | `3b832457eb45b1e70619432e85423ddf1a5eb67188ae5296b53e43cb9bb51aa7` |
| `viso-player-0.25.0.tar.gz` | `5cca141e4ef9a59f872a2b3beef1ec5c83ca5e2d7496c9a880cb37ce9d1d5040` |
