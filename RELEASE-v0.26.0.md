# Viso Player 0.26.0

Current USB image: **`viso-player-0.26.0.iso`**. Machines already on **0.24.0** or **0.25.0** can apply this build from **Device → Updates** when the OTA package is published. Versions before 0.24.0 still need a USB install (see [v0.24.0](https://github.com/zabelez/viso-player-releases/releases/tag/v0.24.0)).

## What is new

- **Stable source binding by `source_id`.** Display routes stick to the Viso source identity, not a frozen `viso://host:port/…` URL. After a Gateway cold-start on a new control/RTP block, the player rediscovers via VIS0 and rejoins without remapping **Displays**.
- **Same-name publishers.** If two Gateways announce the same `source_id`, the player keeps the host it is already using while that announce is live, then fails over when that announce expires.
- **Lip-sync with Gateway 0.3.0.** RTCP Sender Reports on video and audio map RTP time onto a local clock, so Mac and Player clocks can disagree without audio waiting seconds to start.
- **Picture stays live.** Video shows the latest frame as it arrives (holding to an absolute clock was freezing or lagging the image).
- **Audio stays smooth.** PCM plays into a primed buffer; the ring soft-trims when full instead of cutting out or stuttering when encode is slower than realtime.
- **Built for Gateway 0.3.0.** High Quality restart on the Mac can keep the same URL; this Player covers the cases that still move ports and consumes the new A/V timing.

## Update Viso Gateway too

**This Player needs [Viso Gateway 0.3.0](https://github.com/zabelez/viso-gateway-releases/releases/tag/v0.3.0) (or later).** Replace the Gateway apps on the Mac before you rely on this player in a room.

Download Gateway, Gateway NDI, and Gateway Screen from [viso-gateway-releases](https://github.com/zabelez/viso-gateway-releases/releases/tag/v0.3.0).

## What you should see after installing

1. Write **`viso-player-0.26.0.iso`** (Balena Etcher, or Rufus in **DD Image** mode). Boot from USB.
2. A 15-second menu appears. If you do nothing, **Try** starts. To keep the player, choose **Install**, let it finish, and **remove the USB** when asked.
3. Displays start black — press **SPACE** for the address. Open `https://<IP>`, accept the certificate warning, and set the operator password.
4. **Device → License** — email **contact@sysontech.com** with the Device UUID, paste the token, Activate.
5. **Displays** — pick a Viso source for each screen. If the Gateway restarts and the control port changes, playback should recover without editing the route URL. On Gateway Screen / NDI with 0.3.0, picture and sound should stay together without stutter.

## Already on 0.24.0 or 0.25.0

Open **Device → Updates**, check, and apply **0.26.0**. You do not need to reinstall from USB unless you prefer a clean install. Update the Gateway Macs to **0.3.0** at the same time.

## Downloads

| File | Purpose |
|------|---------|
| `viso-player-0.26.0.iso` | Try or Install. **Install erases the target disk.** |
| `viso-player-0.26.0.iso.sha256` | Verify the image |
| `viso-player-0.26.0.tar.gz` | In-place update for machines already on **0.24.0** or **0.25.0**. |
| `viso-player-0.26.0.tar.gz.sha256` | Verify the update package |
| `latest.json` / `latest.json.sig` | Signed update manifest for **Device → Updates**. |

| File | SHA-256 |
|------|---------|
| `viso-player-0.26.0.iso` | `20c9830523f8d1ec1e37659586e589f92386c5bbe3a98b0e79d0c76a870cb082` |
| `viso-player-0.26.0.tar.gz` | `968214cef6fb3aa441e25976c01777a6950a54c790650a577e808bd03e1621b8` |
