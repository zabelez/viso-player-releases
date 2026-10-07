# Viso Player 0.27.0

Current USB image: **`viso-player-0.27.0.iso`**. Machines already on **0.24.0**, **0.25.0**, **0.26.0**, or **0.26.1** can apply this build from **Device → Updates**. Versions before 0.24.0 still need a USB install (see [v0.24.0](https://github.com/zabelez/viso-player-releases/releases/tag/v0.24.0)).

## What is new

- **Inputs tab.** A player with a Blackmagic capture device now turns its HDMI input into a Viso source. The new **Inputs** tab shows signal, format, encoder, receivers, and dropped frames for each input, and lets you name, enable, or disable it.
- **One card per capture device.** Each device gets its own card, with a tab per connector (on the UltraStudio Recorder 3G, **HDMI** and **SDI**). Each tab shows the input's name, with the connector below it. A card appears as soon as a device is connected and shows **Disconnected** when it is unplugged. The list stays empty until a device is connected.
- **Devices you name and keep.** Click a device's title to rename it. The player remembers every device it has seen, with its name and input settings, across reboots and unplugging, and connecting another device does not change the ones already there. A device that is disconnected and no longer needed can be deleted from its card, together with its input settings.
- **Captured video on the network.** Each enabled input is published as a `viso://` source that other players and Gateways can pick like any other source. It follows format changes, cable pulls, and device replugs without editing routes.
- **Captured video on the same player.** The player's own displays can show its inputs directly, without going through the network.
- **Blackmagic driver included.** The ISO, Try, and the OTA package include Blackmagic Desktop Video 16.4a1. Try has it ready to use. An installed player builds it during install or on the first start after the update; that build needs a network connection, and without one it retries on the next start or boot. The OTA package is larger than usual (about 315 MB).
- **Conversion and H.264 on the GPU.** On Intel GPUs the player converts and scales the captured picture on the GPU and encodes it there (VAAPI), so a 1080p60 input uses a fraction of the CPU it used to. If a GPU step is not available, it falls back to copying through the GPU and then to the CPU (libx264), and the **Inputs** tab says which path is in use and why.
- **Quality settings per input.** Each input has a profile: **Automatic**, **Low latency**, **Best quality**, **Save CPU**, or **Custom**. **Advanced** exposes every setting that affects the picture: GPU or CPU conversion, scaler, color matrix, deinterlacing, denoise and sharpening, rate control and bitrate, keyframe interval, H.264 profile, encoder presets, the GPU device, the low-resolution copy, queue depth, overload behaviour, and network pacing. Each setting shows the value in effect and stays on **Automatic** until you change it; options the hardware cannot do are greyed out.
- **Overload behaviour you choose.** If a machine cannot keep up, the input halves its frame rate by default until the encoder restarts. **Advanced** can make it return to full rate once the load drops, or never reduce it.
- **Readable screen captures.** A captured computer screen with small text arrives sharp on the receiving players, at the automatic bitrate and above.
- **Input settings kept across updates.** Updates after this one keep each device's name and each input's settings.
- **API.** `GET /api/inputs` lists devices and inputs with their live state; inputs and devices can be changed, renamed, and deleted through the API. See **API** in the web UI.

## What is fixed

- **Try: restart and power off finish.** Restarting or powering off a player running Try from USB no longer stops at a hidden prompt at the end.

## Supported capture

- Tested with the **Blackmagic UltraStudio Recorder 3G** on Thunderbolt 3, through **HDMI**, up to **1080p60**, with embedded HDMI stereo audio. The **SDI** connector appears in the Inputs tab but was not tested. A device captures from one connector at a time.
- One 1080p60 input per player. Two inputs at once are not supported on the tested machine (Intel HD 520 graphics).
- On the tested machine, a captured input reaches another player's screen in about 70 ms, and the same player's own screen in about 60 ms (95th percentile, including the capture device).
- With **Secure Boot** on, the Blackmagic driver does not load and the **Inputs** tab reports it. Turn Secure Boot off in the firmware, or contact support to enroll the driver's signing key.
- Update the players that receive an input to 0.27.0 as well. Older players can show it, but may lose parts of the picture on sharp, detailed content at high bitrates.

## Viso Gateway

**Pair with [Viso Gateway 0.3.1](https://github.com/zabelez/viso-gateway-releases/releases/tag/v0.3.1).** 0.27.0 needs no Gateway change. If a Gateway is older than 0.3.1, update it at the same time: players in other rooms and departments get picture and sound only when both are updated.

## What you should see after installing

1. Write **`viso-player-0.27.0.iso`** (Balena Etcher, or Rufus in **DD Image** mode). Boot from USB.
2. A 15-second menu appears. If you do nothing, **Try** starts. To keep the player, choose **Install**, let it finish, and **remove the USB** when asked.
3. Displays start black — press **SPACE** for the address. Open `https://<IP>`, accept the certificate warning, and set the operator password.
4. **Device → License** — email **contact@sysontech.com** with the Device UUID, paste the token, Activate.
5. **Inputs** — connect the Blackmagic device. Its card appears with a tab per connector; plug in a source and the HDMI tab shows signal and format. Name the input and turn it on to publish it.
6. **Displays** — pick the input's source on this player or on any other player.

## Already on 0.24.0, 0.25.0, 0.26.0, or 0.26.1

Open **Device → Updates**, check, and apply **0.27.0**. You do not need to reinstall from USB unless you prefer a clean install. The download is about 315 MB, and an installed player needs a network connection on the first start after the update to build the Blackmagic driver.

## Downloads

| File | Purpose |
|------|---------|
| `viso-player-0.27.0.iso` | Try or Install. **Install erases the target disk.** |
| `viso-player-0.27.0.iso.sha256` | Verify the image |
| `viso-player-0.27.0.tar.gz` | In-place update for machines already on **0.24.0**, **0.25.0**, **0.26.0**, or **0.26.1**. |
| `viso-player-0.27.0.tar.gz.sha256` | Verify the update package |
| `latest.json` / `latest.json.sig` | Signed update manifest for **Device → Updates**. |

| File | SHA-256 |
|------|---------|
| `viso-player-0.27.0.iso` | `0176256f1fb1f96a2af4351f20ed503281e8fc1895afc7ad6c2166ebdfe92092` |
| `viso-player-0.27.0.tar.gz` | `b47672bd6d73eed5984aa35189c80cbd993f35f15037549fd0918d8cb80f3a25` |
