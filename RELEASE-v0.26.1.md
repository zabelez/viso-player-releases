# Viso Player 0.26.1

Current USB image: **`viso-player-0.26.1.iso`**. Machines already on **0.24.0**, **0.25.0**, or **0.26.0** can apply this build from **Device → Updates** when the OTA package is published. Versions before 0.24.0 still need a USB install (see [v0.24.0](https://github.com/zabelez/viso-player-releases/releases/tag/v0.24.0)).

## What is fixed

- **Sources from other rooms and departments.** A player on another part of the network could list a Gateway source but show no picture. With Gateway 0.3.1, picture and sound now arrive, including through firewalls between networks.
- **Older Gateways keep working.** With Gateway 0.3.0 the player plays as 0.26.0 did.

## Update Viso Gateway too

**Pair this Player with [Viso Gateway 0.3.1](https://github.com/zabelez/viso-gateway-releases/releases/tag/v0.3.1).** The fix needs both the Player and the Gateway updated. Replace Gateway, Gateway NDI, and Gateway Screen on the Mac at the same time.

## What you should see after installing

1. Write **`viso-player-0.26.1.iso`** (Balena Etcher, or Rufus in **DD Image** mode). Boot from USB.
2. A 15-second menu appears. If you do nothing, **Try** starts. To keep the player, choose **Install**, let it finish, and **remove the USB** when asked.
3. Displays start black — press **SPACE** for the address. Open `https://<IP>`, accept the certificate warning, and set the operator password.
4. **Device → License** — email **contact@sysontech.com** with the Device UUID, paste the token, Activate.
5. **Displays** — pick a Viso source for each screen. A source from Gateway 0.3.1 in another department now shows picture and, for NDI and Screen, sound.

## Already on 0.24.0, 0.25.0, or 0.26.0

Open **Device → Updates**, check, and apply **0.26.1**. You do not need to reinstall from USB unless you prefer a clean install. Update the Gateway Macs to **0.3.1** at the same time.

## Downloads

| File | Purpose |
|------|---------|
| `viso-player-0.26.1.iso` | Try or Install. **Install erases the target disk.** |
| `viso-player-0.26.1.iso.sha256` | Verify the image |
| `viso-player-0.26.1.tar.gz` | In-place update for machines already on **0.24.0**, **0.25.0**, or **0.26.0**. |
| `viso-player-0.26.1.tar.gz.sha256` | Verify the update package |
| `latest.json` / `latest.json.sig` | Signed update manifest for **Device → Updates**. |

| File | SHA-256 |
|------|---------|
| `viso-player-0.26.1.iso` | `1797e870c2a015c8b3725d4e8dda1dcf9354786ac784b38d2e745bd93bd8499f` |
| `viso-player-0.26.1.tar.gz` | `2510cb1a40141674e2671c74395d9cfc216c10bf281ee66647ec85fcd875f932` |
