# Viso Player 0.29.2

Current USB image: **`viso-player-0.29.2.iso`**. Machines already on **0.24.0**, **0.25.0**, **0.26.0**, **0.26.1**, **0.27.0**, **0.27.1**, **0.28.0**, **0.29.0**, or **0.29.1** can apply this build from **Device → Updates**. Versions before 0.24.0 still need a USB install (see [v0.24.0](https://github.com/zabelez/viso-player-releases/releases/tag/v0.24.0)).

## What is fixed

- **Recording starts on its own.** Starting a recording no longer waits for the capture driver install. A stream recording writes a file as soon as the picture arrives. An input recording waits for that input's signal.
- **Live streaming starts on its own.** Sending a source to a live platform no longer waits for the capture driver install.
- **Recorded files.** While the recorder is not running, the recording card stays idle and **Recorded files** says the recording service is not reporting state.

## What you should see after installing

1. Write **`viso-player-0.29.2.iso`** (Balena Etcher, or Rufus in **DD Image** mode). Boot from USB.
2. A 15-second menu appears. If you do nothing, **Try** starts. To keep the player, choose **Install**, let it finish, and **remove the USB** when asked.
3. Displays start black — press **SPACE** for the address. Open `https://<IP>`, accept the certificate warning, and set the operator password.
4. Start a recording of a Viso stream. A file appears under **Recorded files** while that recording is running.

## Already on 0.24.0 through 0.29.1

Open **Device → Updates**, check, and apply **0.29.2**. You do not need to reinstall from USB unless you prefer a clean install.

## Downloads

| File | Purpose |
|------|---------|
| `viso-player-0.29.2.iso` | Try or Install. **Install erases the target disk.** |
| `viso-player-0.29.2.iso.sha256` | Verify the image |
| `viso-player-0.29.2.tar.gz` | In-place update for machines already on **0.24.0** through **0.29.1**. |
| `viso-player-0.29.2.tar.gz.sha256` | Verify the update package |
| `latest.json` / `latest.json.sig` | Signed update manifest for **Device → Updates**. |

| File | SHA-256 |
|------|---------|
| `viso-player-0.29.2.iso` | `a1daf9f97870a35a358cf6f84861516c6cf1c9c1ac19ee3950e483589618bf55` |
| `viso-player-0.29.2.tar.gz` | `3bcaf2244e5b824bd5a0fb9b31bba4d44f56de7aa94bcb01edf114da86601da1` |
