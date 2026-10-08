# Viso Player 0.27.1

Current USB image: **`viso-player-0.27.1.iso`**. Machines already on **0.24.0**, **0.25.0**, **0.26.0**, **0.26.1**, or **0.27.0** can apply this build from **Device → Updates**. Versions before 0.24.0 still need a USB install (see [v0.24.0](https://github.com/zabelez/viso-player-releases/releases/tag/v0.24.0)).

## What is new

- **Transport on Network → Viso Communication.** Choose **Automatic**, **UDP**, or **TCP**. Apply restarts the player.
- **Automatic.** The player sends the UDP JOIN. If the Gateway does not answer within 1 second, the player opens TCP to the announced control port and picture and sound come back on that connection. If TCP drops, it tries UDP again.
- **UDP.** Only the UDP JOIN. Silence does not open TCP.
- **TCP.** Connects to the control port immediately and does not send a UDP JOIN. If the connection fails, it tries TCP again.
- A player with no saved choice uses **Automatic**.

## What is fixed

- **Two displays, one source.** A display that is following a live shared decode waits for that picture. It no longer treats the wait as a dead session and tears the shared decode down.
- **A display that blinks off the probe.** A sink that was live and then fails the probe keeps the session through a short grace. A closed lid still stops immediately, and a cable that stays out still ends the receiver.

## Viso Gateway

**Pair with [Viso Gateway 0.5.0](https://github.com/zabelez/viso-gateway-releases/releases/tag/v0.5.0) when you use TCP.** Gateway 0.5.0 listens for UDP and TCP on the announced control port. UDP still works with Gateway 0.4.0 and 0.3.1. An older Gateway does not accept the TCP connection.

## What you should see after installing

1. Write **`viso-player-0.27.1.iso`** (Balena Etcher, or Rufus in **DD Image** mode). Boot from USB.
2. A 15-second menu appears. If you do nothing, **Try** starts. To keep the player, choose **Install**, let it finish, and **remove the USB** when asked.
3. Displays start black — press **SPACE** for the address. Open `https://<IP>`, accept the certificate warning, and set the operator password.
4. **Network → Viso Communication → Transport** — Automatic, UDP, or TCP. Apply restarts the player.

## Already on 0.24.0 through 0.27.0

Open **Device → Updates**, check, and apply **0.27.1**. You do not need to reinstall from USB unless you prefer a clean install.

## Downloads

| File | Purpose |
|------|---------|
| `viso-player-0.27.1.iso` | Try or Install. **Install erases the target disk.** |
| `viso-player-0.27.1.iso.sha256` | Verify the image |
| `viso-player-0.27.1.tar.gz` | In-place update for machines already on **0.24.0**, **0.25.0**, **0.26.0**, **0.26.1**, or **0.27.0**. |
| `viso-player-0.27.1.tar.gz.sha256` | Verify the update package |
| `latest.json` / `latest.json.sig` | Signed update manifest for **Device → Updates**. |

| File | SHA-256 |
|------|---------|
| `viso-player-0.27.1.iso` | `PENDING` |
| `viso-player-0.27.1.tar.gz` | `PENDING` |
