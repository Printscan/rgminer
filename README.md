<div align="center">
  <img src="https://github.com/user-attachments/assets/326320f2-f0f8-4978-bbfe-2c28da2ae56a" alt="RGminer" width="500" />
</div>

<p align="center">
  <a href="https://rgminer.net/"><img alt="Official website and web panel: rgminer.net" src="https://img.shields.io/badge/Website-rgminer.net-ff743d?style=for-the-badge" width="250" height="40" /></a><a href="https://t.me/rgpool"><img alt="Telegram: @rgpool" src="https://img.shields.io/badge/Telegram-@rgpool-229ED9?style=for-the-badge&amp;logo=telegram&amp;logoColor=white" width="250" height="40" /></a>
</p>

<p align="center">
  <a href="https://github.com/Printscan/rgminer/releases/download/v1.1.4/RGMiner-NVIDIA-617.42-Setup.exe" title="Download Windows NVIDIA 617.42 driver — release v1.1.4"><img alt="Download NVIDIA 617.42 driver (v1.1.4)" src="https://img.shields.io/badge/Download%20driver-NVIDIA%20617.42-76B900?style=for-the-badge&amp;logo=nvidia&amp;logoColor=white" width="250" height="40" /></a>
</p>

<p align="center">
  <a href="https://github.com/Printscan/rgminer/releases"><img alt="Release" src="https://img.shields.io/badge/release-v1.1.6-2ea44f"></a>
  <a href="#download"><img alt="Platforms" src="https://img.shields.io/badge/platforms-Linux%20%7C%20Windows%20%7C%20Docker-blue"></a>
  <a href="#overview"><img alt="GPU" src="https://img.shields.io/badge/GPU-NVIDIA-76b900"></a>
  <a href="#cli-options"><img alt="CUDA" src="https://img.shields.io/badge/backend-CUDA-76b900"></a>
</p>

<a id="overview"></a>

<table align="center" width="100%">
  <thead>
    <tr><th>Coin</th><th><code>--algo</code></th><th>Algorithm</th><th>Miner fee</th></tr>
  </thead>
  <tbody>
    <tr><td>Pearl</td><td><code>pearl</code></td><td>PearlHash</td><td>2%</td></tr>
    <tr><td>Quantus</td><td><code>quantus</code></td><td>Poseidon2</td><td>2%</td></tr>
    <tr><td>Nockchain</td><td><code>nock-zk</code></td><td>Nock-ZK</td><td>2%</td></tr>
    <tr><td>NOID</td><td><code>noid</code></td><td>NOID</td><td>2%</td></tr>
  </tbody>
</table>

<a id="performans"></a>

## Performance / Производительность

<details>
<summary><strong>Pearl</strong></summary>

| GPU | Hashrate, TH/s | Power, W | Core Offset | Core, MHz | Memory, MHz | Mem offset | Efficiency, TH/s/W |
|---|---:|---:|---:|---:|---:|---:|---:|
| Tesla V100-SXM2-16GB | **≈37.85** | **215†** | — | 1350 | 405 | — | **≈0.176** |
| CMP 40HX | **≈52.91** | **≈108.08–113.33** | 255 | 1716 | 405 | — | **≈0.467–0.490** |
| RTX 2080 | **≈76.50** | **≈139.59–146.28** | 135 | 1716 | 405 | — | **≈0.530–0.556** |
| CMP 50HX | **≈91.26** | **≈168.43–176.60** | 255 | 1716 | 405 | — | **≈0.517–0.542** |
| CMP 70HX | **≈56.50** | **≈104.57–105.54** | 255 | 1650 | 405 | — | **≈0.535–0.540** |
| RTX 3060 Ti | **≈63.89** | **≈78.14–81.93** | 255 | 1650 | 405 | — | **≈0.780–0.818** |
| RTX 3070m | **≈67.35** | **≈74.63–78.24** | 255 | 1650 | 405 | — | **≈0.861–0.902** |
| RTX 3070 | **≈77.42** | **≈92.45–96.93** | 255 | 1650 | 405 | — | **≈0.799–0.837** |
| CMP 90HX | **≈83.73** | **≈103.92–114.00** | 300 | 1650 | 405 | — | **≈0.735–0.806** |
| RTX 3080 Ti | **≈134.44** | **≈164.44–172.42** | 255 | 1650 | 405 | — | **≈0.780–0.818** |
| RTX 3090 | **≈137.36** | **≈175.59–184.11** | 255 | 1650 | 405 | — | **≈0.746–0.782** |
| CMP 170HX | **≈210.74** | **≈224.83–242.29** | 300 | 1455 | 600 | — | **≈0.870–0.937** |
| RTX 4070 Ti | **≈150.12** | **≈114.41–121.67** | 345 | 2445 | 405 | — | **≈1.234–1.312** |
| RTX 4090 | **≈318.81** | **≈260.41–273.05** | 315 | 2445 | 405 | — | **≈1.168–1.224** |
| RTX 5070 Ti | **≈173.91** | **≈133.17–139.63** | 499 | 2445 | 405 | — | **≈1.246–1.306** |

</details>

<details>
<summary><strong>Quantus</strong></summary>

| GPU | Hashrate, MH/s | Power, W | Core Offset | Core, MHz | Memory, MHz | Mem offset | Efficiency, MH/s/W |
|---|---:|---:|---:|---:|---:|---:|---:|
| P104-100 | **49.06†** | **87.94†** | 150 | 1650 | — | -2000 | **0.558†** |
| CMP 100-100 | **68.44†** | **189.7†** | — | 1455 | 837 | — | **0.361†** |
| GTX 1660 Super | **≈158.25** | **55.36†** | 150 | 1650 | 405 | — | **≈2.858** |
| GTX 1660 Ti | **≈172.69** | **56.19†** | 150 | 1650 | 405 | — | **≈3.073** |
| RTX 2060 | **≈215.43** | **80.20†** | 210 | 1650 | 405 | — | **≈2.686** |
| RTX 2070 | **≈256.03** | **93.74†** | 200 | 1650 | 405 | — | **≈2.731** |
| RTX 2080 | **≈328.26** | **120.80†** | 115 | 1650 | 405 | — | **≈2.717** |
| CMP 50HX | **≈401.02** | **119.11†** | 250 | 1650 | 405 | — | **≈2.371** |
| RTX 3060 Ti | **≈279.35** | **85.00†** | 300 | 1650 | 405 | — | **≈3.286** |
| RTX 3070m | **≈294.15** | **67.00†** | 250 | 1650 | 405 | — | **≈4.390** |
| RTX 3070 | **≈337.94** | **90.26†** | 300 | 1650 | 405 | — | **≈3.744** |
| RTX 3080 | **≈496.31** | **144.24†** | 300 | 1650 | 405 | —  | **≈3.441** |
| RTX 3080 Ti | **≈581.55** | **166.57†** | 300 | 1650 | 405 | —  | **≈3.491** |
| CMP 90HX | **≈366.74** | **165.99†** | 300 | 1650 | 405 | —  | **≈2.209** |
| CMP 170HX | **≈461.52** | **141.78†** | 210 | 1450 | 600 | — | **≈3.072** |
| RTX 4070 Ti | **≈652.92** | **138.03†** | 300 | 2460 | 405 | — | **≈4.730** |
| RTX 4090 | **≈1393.95** | **294.11†** | 315 | 2460 | 405 | — | **≈4.740** |
| RTX 5070 Ti | **≈753.90** | **154†** | 499 | 2460 | 405 | — | **≈4.895** |

</details>

<details>
<summary><strong>Nock-ZK</strong></summary>

| GPU | Hashrate, MH/s | Power, W | Core Offset | Core, MHz | Memory, MHz | Mem offset | Efficiency, MH/s/W |
|---|---:|---:|---:|---:|---:|---:|---:|
| RTX 2080 | **24.65†** | **155.13†** | 115 | 1650 | 5000 | 0 | **0.159†** |
| CMP 50HX | **29.18†** | **198.63†** | 250 | 1650 | 5000 | 0 | **0.147†** |
| RTX 3060 Ti | **20.33†** | **124.64†** | 300 | 1650 | 5000 | 0 | **0.163†** |
| RTX 3070m | **21.42†** | **76.09†** | 250 | 1650 | 5000 | 0 | **0.282†** |
| RTX 3070 | **24.62†** | **129.90†** | 300 | 1650 | 5000 | 0 | **0.190†** |
| RTX 3080 Ti | **42.83†** | **236.61†** | 300 | 1650 | 5000 | 0 | **0.181†** |
| CMP 90HX | **26.62†** | **176.31†** | 300 | 1650 | — | -2000 | **0.151†** |
| RTX 4070 Ti | **47.33†** | **148.45†** | 300 | 2460 | 5000 | 0 | **0.319†** |
| RTX 4090 | **100.07†** | **304.23†** | 315 | 2460 | 5000 | 0 | **0.329†** |
| RTX 5070 Ti | **61.86†** | **191.16†** | 499 | 2460 | 5000 | 0 | **0.324†** |
| CMP 170HX | **34.01** | **150** | — | 1450 | 800 | — | **0.227** |

</details>

<details>
<summary><strong>NOID</strong></summary>

| GPU | Hashrate, MH/s | Power, W | Core Offset | Core, MHz | Memory, MHz | Mem offset | Efficiency, MH/s/W |
|---|---:|---:|---:|---:|---:|---:|---:|
| RTX 3070m | **40.234** | **72.23** | — | 1650 | 405 | — | **0.557** |
| RTX 4070 Ti | **92.4** | **147** | — | 2460 | 405 | — | **0.629** |
| RTX 5080 | **139.45** | **225.67** | — | 2647 | 405 | — | **0.618** |
| RTX 2080 | **18.31** | **110** | — | 1650 | 405 | — | **0.166** |
| CMP 170HX | **97.5** | **140** | — | 1450 | 600 | — | **0.696** |

</details>

---

<a id="hiveos"></a>

## HiveOS

<details>
<summary><strong>Pearl</strong></summary>

```json
{
  "isFavorite": false,
  "items": [
    {
      "coin": "pearl",
      "pool_ssl": false,
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "rgminer-1.1.6",
      "miner_config": {
        "url": "YOUR_POOL",
        "algo": "pearlhash",
        "miner": "rgminer-1.1.6",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v1.1.6/rgminer-1.1.6-hiveos.tar.gz"
      },
      "pool_geo": []
    }
  ]
}
```

</details>

<details>
<summary><strong>Quantus</strong></summary>

```json
{
  "isFavorite": false,
  "items": [
    {
      "coin": "quantus",
      "pool_ssl": false,
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "rgminer-1.1.6",
      "miner_config": {
        "url": "YOUR_POOL",
        "algo": "quantus",
        "miner": "rgminer-1.1.6",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v1.1.6/rgminer-1.1.6-hiveos.tar.gz"
      },
      "pool_geo": []
    }
  ]
}
```

</details>

<details>
<summary><strong>Nock-ZK</strong></summary>

```json
{
  "isFavorite": false,
  "items": [
    {
      "coin": "pearl",
      "pool_ssl": false,
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "rgminer-1.1.6",
      "miner_config": {
        "url": "YOUR_POOL",
        "algo": "zkpow",
        "miner": "rgminer-1.1.6",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v1.1.6/rgminer-1.1.6-hiveos.tar.gz"
      },
      "pool_geo": []
    }
  ]
}
```

</details>

<details>
<summary><strong>NOID</strong></summary>

```json
{
  "isFavorite": false,
  "items": [
    {
      "coin": "noid",
      "pool_ssl": false,
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "rgminer-1.1.6",
      "miner_config": {
        "url": "YOUR_POOL",
        "algo": "noid",
        "miner": "rgminer-1.1.6",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v1.1.6/rgminer-1.1.6-hiveos.tar.gz"
      },
      "pool_geo": []
    }
  ]
}
```

</details>

---

<a id="download"></a>

| Platform | Release file |
|---|---|
| Linux standalone | [`rgminer-1.1.6`](https://github.com/Printscan/rgminer/releases/download/v1.1.6/rgminer-1.1.6) |
| Windows | [`rgminer-1.1.6-windows.zip`](https://github.com/Printscan/rgminer/releases/download/v1.1.6/rgminer-1.1.6-windows.zip) |
| HiveOS | [`rgminer-1.1.6-hiveos.tar.gz`](https://github.com/Printscan/rgminer/releases/download/v1.1.6/rgminer-1.1.6-hiveos.tar.gz) |
| MMPOS | [`rgminer-1.1.6-mmpos.tar.gz`](https://github.com/Printscan/rgminer/releases/download/v1.1.6/rgminer-1.1.6-mmpos.tar.gz) |
| Docker | [`palmatorro/rgminer`](https://hub.docker.com/r/palmatorro/rgminer) |

---

<a id="miner-settings"></a>

## MINER SETTINGS / НАСТРОЙКИ МАЙНЕРА
<a id="english"></a>

<details>
<summary><strong>English</strong></summary>

<a id="english-contents"></a>

## Contents

- [New in 1.1.6](#whats-new)
- [Quick Start](#quick-start)
- [Algorithms](#algorithms)
- [CLI Options](#cli-options)
- [Memory Control](#memory-control)
- [Smart Tuning](#smart-tune)
- [GPU Recovery](#gpu-recovery)
- [Web Panel](#web-panel)
- [Referral System](#referral)
- [Miner API](#miner-api)
- [Overclock](#overclock)
- [CMP Options](#cmp-options)
- [Troubleshooting](#troubleshooting)
- [Resources](#resources)

---

<a id="whats-new"></a>

## New in 1.1.6 <sub><a href="#english-contents">↑ Back to contents</a></sub>

### Pearl / Pearlhash

- Improved energy efficiency by **3–8%** across RTX 20–50 series, depending on the architecture.
- Increased hashrate by **2% on RTX 50 series** and approximately **0.4% on other architectures**.
- Added support for **Peryn.ai** and **MaxPool (`maxpool.pro`)**.
- Fixed telemetry reporting for **Pearl Fortune**.

### Nockchain / Nock-ZK

- Added support for three more pools: **Gigahash, NockMining and TheFactory**.
- Increased **CMP 170HX** hashrate by **14.5%**.
- CMP 170HX reference result: **34.01 MH/s at 150 W**, with **1450 MHz core / 600 MHz memory**.

### Quantus

- **GTX 16xx / RTX 20 series:** hashrate **+1.7%**.
- **RTX 30 series:** hashrate **+3.5%**.
- **RTX 40 series:** hashrate **+3%**.
- **RTX 50 series:** hashrate **+5%**.

### NOID

- Added **NOID** mining support.
- Supported Stratum pools: **Suprnova, InnovLab and RPlant**.
- Developer fee: **2%**.
- Reference hashrates, power readings and clock settings are listed in the [performance section](#performans).

### Pool and runtime improvements

- Improved pool handling during frequent reconnects. This reduces the impact of unstable connections but cannot fix problems on the provider's side.
- Reduced miner **RAM usage and CPU load**.
- Removed **Exfer** support.

### Windows

- Fixed GPU unlocking on **multi-GPU systems** that previously encountered errors.
- Corrected unlocking for **CMP 40HX and CMP 70HX**.
- Added compatibility fixes aimed at **older systems**.

---

<a id="quick-start"></a>

## Quick Start <sub><a href="#english-contents">↑ Back to contents</a></sub>

Make the standalone Linux release executable and start it with an algorithm, pool and wallet:

```bash
chmod +x rgminer-1.1.6

./rgminer-1.1.6 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name WORKER
```

Several pools can be specified in priority order:

```bash
./rgminer-1.1.6 \
  --algo pearl \
  --stratum HOST1:PORT1,HOST2:PORT2 \
  --wallet WALLET
```

Use `stratum+tls://` or `--stratum-tls` to enable verified TLS:

```bash
./rgminer-1.1.6 \
  --algo pearl \
  --stratum stratum+tls://HOST:PORT \
  --wallet WALLET
```

Docker installation and launch:

```bash
docker pull palmatorro/rgminer:TAG

docker run -d \
  --gpus all \
  --restart unless-stopped \
  --name rgminer \
  palmatorro/rgminer:TAG \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name docker-rig
```

Replace `TAG` with a published image tag from [Docker Hub](https://hub.docker.com/r/palmatorro/rgminer). The host must have a working NVIDIA driver, Docker and `nvidia-container-toolkit`.

---

<a id="algorithms"></a>

## Algorithms <sub><a href="#english-contents">↑ Back to contents</a></sub>

| `--algo` value | Purpose | Dev fee |
|---|---|---|
| `pearl` | Pearl GPU mining | 2% |
| `quantus` | Quantus GPU mining | 2% |
| `nock-zk` | Nockchain v5 GPU mining | 2% |
| `noid` | NOID Stratum mining | 2% |

Pearl example:

```bash
./rgminer-1.1.6 --algo pearl --stratum HOST:PORT --wallet WALLET
```

Quantus example (2% dev fee):

```bash
./rgminer-1.1.6 --algo quantus --stratum HOST:PORT --wallet WALLET
```

Nockchain example (2% miner fee; [RabbitMiner](https://rabbitminer.cc/) pool fee 2.5%):

```bash
./rgminer-1.1.6 --algo nock-zk --proto rabbit --stratum nl2.rabbitminer.cc:1108 --wallet WALLET --worker-name RIG
```

NOID example (Suprnova, InnovLab or RPlant; 2% dev fee):

```bash
./rgminer-1.1.6 --algo noid --stratum HOST:PORT --wallet WALLET
```

---

<a id="cli-options"></a>

## CLI Options <sub><a href="#english-contents">↑ Back to contents</a></sub>

The table below describes the `rgminer-1.1.6` command-line options.

### Pool connection

| Option | Description |
|---|---|
| `--algo ALGO` | Select `pearl`, `quantus`, `nock-zk` or `noid`. |
| `--stratum HOST:PORT[,HOST:PORT]` | Pool endpoint or a priority-ordered pool list. |
| `--wallet WALLET`, `--address WALLET` | Payout wallet or pool user. |
| `--worker NAME`, `--worker-name NAME` | Worker or rig name. |
| `--stratum-pass PASS` | Pool password. |
| `--stratum-tls` | Force verified TLS for Stratum. |
| `--proto NAME` | Select a pool protocol. |

### GPU, API and safety

| Option | Description |
|---|---|
| `-d GPU[,GPU]`, `--devices GPU[,GPU]` | Select CUDA device indices. |
| `--token TOKEN` | Connect to your account on the official web panel; its address is built in. |
| `--api-host HOST` | API listener address. Use with `--api-port`. |
| `--api-port PORT` | API listener port. Use with `--api-host`. |
| `--plain-console` | Disable the live console UI and print plain log output. |
| `--watchdog=off`, `--watchdog=restart`, `--watchdog=reboot` | GPU recovery policy. `--smart-tune on` selects `reboot`; other effective policies forbid host reboot. |
| `--tune-fan-fix [0-100]` | Hold fans at a fixed percentage during autotune; bare flag means 100%. |
| `--mem-control on/off` | Automatic memory profile; default `on`. |
| `--smart-tune on/off` | Independent per-GPU tuning; default `off`. |

<a id="memory-control"></a>

### `--mem-control`

Automatic memory control is now **enabled by default**: `--mem-control on`.

- Extended support for **405 / 810 MHz** memory modes to GPUs where these settings were previously unavailable, including **Windows**.
- The miner automatically selects a memory profile for the algorithm and GPU, using GPU **P-state configuration**.
- Settings changed by the miner are restored when it stops.
- If another miner changed the GPU's P-state settings without restoring them, a **rig reboot may be required when upgrading** to restore a clean starting configuration.

Explicit miner OC parameters have the highest priority. **`--lock-mclock`** overrides the automatic memory frequency, and **`--mclock`** overrides the automatic memory offset.

With `--mem-control on`, external memory changes that conflict with the selected automatic profile are returned to the profile values. To use your own memory settings, set `--mem-control off` or specify them through the miner's OC parameters.

<a id="smart-tune"></a>

### `--smart-tune`

Added **smart undervolting**, controlled independently of memory control:

- `--smart-tune off` — disabled **by default**.
- `--smart-tune on` — automatic per-GPU tuning.

The tuner adjusts private GPU controls beyond the usual public core offset and fixed core clock. It works with a fixed core clock or with a **power limit alone**. With `--mem-control on`, the miner also selects the algorithm's memory profile and the supported internal clock settings before tuning.

Tuning proceeds iteratively, using **CUDA runtime errors and GPU recovery status reported by the driver**. Settings are adjusted to **one hardware step**, equivalent to approximately **5–15 MHz of core offset**, depending on the architecture. Unsupported private controls are skipped; where GPC control is unavailable, the supported core-offset tuning path is used.

A typical tuning session takes approximately **30–90 minutes**, depending on the starting settings. After tuning finishes, GPU errors still trigger stepwise corrections toward more stable settings.

> ⚠️ **Before enabling smart tuning**
>
> - Avoid changing clocks during or after tuning, especially increasing them. The selected private settings belong to a specific operating point. The recommended procedure is to **stop the miner, apply the new settings and start it again**.
> - Changes to the **configured fixed core clock, fixed memory clock or PL** start a new tune for the affected operating point. Memory changes are evaluated after applying the `--mem-control` policy and explicit miner overrides.
> - On the first run, use a **known-stable public core offset**: it becomes the initial tuning value and is saved in the cache. When an applicable cache exists, changing only that public offset does not replace the saved starting value or trigger a retune.
> - During tuning, external public core-offset writes are blocked. Adding a public offset on top of the selected private settings can make the GPU unstable and may hang the rig. The original public offset is restored when the miner stops.
> - Tuning state and selected settings are saved automatically, allowing tuning to continue after a restart.

<a id="gpu-recovery"></a>

### GPU recovery

Recovery follows the GPU's condition: the miner can **restart an individual backend, perform a PCIe FLR reset, attempt bus recovery after a GPU falls off the bus, or reboot the host when required**.

Some GPU failures can also block the NVIDIA driver while it waits for the device. In testing, a GPU reset alone did not always release these waits. **`--smart-tune on` therefore selects the `reboot` watchdog policy**, allowing a system reboot when recovery cannot complete. Reboots are forbidden when the effective watchdog policy is not `reboot`.

> ⚠️ **Smart tuning may restart individual GPU backends or reboot the rig.** Allow for this when choosing when to run it.

Smart tuning allows deeper undervolting, particularly on **RTX 20, RTX 40 and RTX 50 series**. RTX 30 series can also reach settings beyond those available through the public core offset alone. The feature will continue to evolve; feedback and test results are welcome. Further recovery improvements are planned to reduce the need for reboots.

API example:

```bash
./rgminer-1.1.6 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --api-host 127.0.0.1 \
  --api-port 9200
```

---

<a id="web-panel"></a>

## Web Panel <sub><a href="#english-contents">↑ Back to contents</a></sub>

Open [rgminer.net](https://rgminer.net/) and create a registration token in your account. Add it to your normal mining command:

```bash
./rgminer-1.1.6 --algo pearl --stratum HOST:PORT --wallet WALLET --token YOUR_TOKEN
```

The official panel address and its server trust anchor are built into this release; no extra panel address is needed. The token is displayed only when created, so copy it then and keep it private. Mining without the panel does not require a token.

The panel shows rig status, live GPU telemetry and hashrate history. You can edit the algorithm, wallet, worker, pools and watchdog, apply GPU profiles and per-card settings as a batch, and use available miner start, stop or restart controls. A rig's panel access can be revoked even while it is offline.


- Improved the ways rigs connect to the web panel.
- Improved the panel's **UI/UX**.
- Added **email linking** and **two-factor authentication (2FA)**.

<a id="referral"></a>

## Referral System <sub><a href="#english-contents">↑ Back to contents</a></sub>

**RGMiner is the first miner with a built-in referral system.**

Invite your friends and earn more together :)

**How it works:**

1. A user follows your referral link and registers in the web panel.
2. All rigs linked to that user's account send every tenth **developer-fee share (dev share)** to the wallet you specify in your referral settings.
3. Developer-fee mining uses the **pool selected by the invited user**, following the same connection approach as the regular developer fee. This helps avoid additional pool connectivity problems for the invited user.

To connect a rig, add the token from the website to the miner's launch parameters:

```text
--token "YOUR_WEBSITE_TOKEN"
```

---

<a id="miner-api"></a>

## Miner API <sub><a href="#english-contents">↑ Back to contents</a></sub>

The protected release exposes a read-only JSON API on `127.0.0.1:9200` by default. The launcher aggregates statistics from all selected GPUs and CUDA backend processes.

Change the listener address or port when starting the miner:

```bash
./rgminer-1.1.6 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --api-host 127.0.0.1 \
  --api-port 9200
```

### Endpoints

| Request | Response |
|---|---|
| `GET /health` | API status and the number of currently published GPU records. |
| `GET /metrics` | Detailed JSON statistics for every GPU. |

```bash
curl -s http://127.0.0.1:9200/health
curl -s http://127.0.0.1:9200/metrics
```

`/health` returns:

```json
{"status":"ok","running":1}
```

In the protected release, `running` is the number of GPU records currently present in the launcher's aggregated metrics snapshot. It confirms API data availability, but does not by itself prove a pool connection, positive hashrate or accepted shares.

`/metrics` returns a `miners` array. Each GPU object contains:

| Fields | Meaning |
|---|---|
| `deviceId`, `deviceIdScope`, `gpuName`, `pciBusId`, `pid` | Physical GPU and backend-process identity. |
| `lastJobId`, `lastHeight`, `algo` | Current mining job and algorithm. |
| `emaRate` | Smoothed hashrate in raw `H/s`. Divide by `1e12` for `TH/s`. |
| `lastChecked`, `lastStatus`, `lastError` | Current work counter, status and latest error. |
| `acceptedShares`, `rejectedShares`, `staleShares`, `foundBlocks` | Share and block counters. |
| `lastDifficulty` | Most recently published difficulty. |
| `totalChecked`, `totalElapsedMs` | Accumulated work and elapsed processing time. |
| `lastUpdated`, `processUptimeMs` | Unix update timestamp and process uptime, both in milliseconds. |

Show the most useful fields:

```bash
curl -s http://127.0.0.1:9200/metrics |
  jq '.miners[] | {
    deviceId,
    gpuName,
    emaRate,
    lastStatus,
    acceptedShares,
    rejectedShares
  }'
```

Calculate the total hashrate in `H/s`:

```bash
curl -s http://127.0.0.1:9200/metrics |
  jq '[.miners[].emaRate] | add // 0'
```

Only `GET` is supported. Unknown paths return `404`, other methods return `405`, and more than 100 requests in one second can return `429` with `Retry-After: 1`.

> [!WARNING]
> The API has no authentication or TLS. Keep the default `127.0.0.1` binding. Expose it to a network only through a firewall, authenticated reverse proxy or VPN.

---

<a id="overclock"></a>

## Overclock <sub><a href="#english-contents">↑ Back to contents</a></sub>

Clock options use physical NVIDIA GPU indices and are applied through NVML. A value without a GPU index applies to all GPUs; indexed values override it for the selected GPU.

| Option | Description |
|---|---|
| `--cclock OFFSET[,GPU:OFFSET]` | Graphics clock offset in MHz. |
| `--mclock OFFSET[,GPU:OFFSET]` | Memory transfer-rate offset in MHz. |
| `--lock-cclock MHz[,GPU:MHz]` | Lock the graphics clock to an absolute value. |
| `--lock-mclock MHz[,GPU:MHz]` | Lock the memory clock to an absolute value. |
| `--pl WATTS[,GPU:WATTS]` | Set the NVIDIA GPU power limit in watts through NVML (Linux and Windows). |
| `--fan %[,GPU:FanSpeed]` | Set the NVIDIA GPU fan speed(Linux и Windows). |

Multi-GPU example:

```bash
./rgminer-1.1.6 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --cclock 0:125,1:250 \
  --mclock 0:500,1:1000 \
  --lock-cclock 0:1650,1:2450 \
  --lock-mclock 0:7000,1:7000 \
  --pl 0:180,1:220
```

On CMP 170HX, `--lock-mclock` and the WebUI also control HBM2 memory registers. The minimum safe applicable memory clock is **525 MHz**. Clock changes require sufficient NVIDIA driver permissions. Start with conservative values and validate each GPU separately.

---

<a id="cmp-options"></a>

## CMP Options <sub><a href="#english-contents">↑ Back to contents</a></sub>

| Option | Description |
|---|---|
| `--cmp-unlock` | Explicitly install or re-enable CMP unlock. |
| `--cmp-unlock-force` | Disable third-party NVIDIA overrides and install CMP unlock. |
| `--no-cmp-unlock` | Disable CMP unlock handling. |
| `--no-cmp-unlock-update` | Retain the installed CMP patch generation. |
| `--cmp-blob-source SOURCE` | Use an HTTPS base URL or an exact CMP blob file. |
| `--cmp-unlock-uninstall` | Restore the saved pre-patch NVIDIA module and reboot. |
| `--unlock-level-map MAP` | Set CMP unlock levels per PCI BDF: `BDF=N[,BDF=N]`. |

CMP unlock options are available on Linux only. CMP 170HX unlocker v4 supports NVIDIA drivers **610.43.02**, **610.57.04** and **615.71.09**. Its update starts automatically when the miner is updated. If you installed a custom unlock and want to keep it, start with `--no-cmp-unlock`. CMP blob download mirrors are used automatically when available.

---

<a id="troubleshooting"></a>

## Troubleshooting <sub><a href="#english-contents">↑ Back to contents</a></sub>

### Show release help

```bash
./rgminer-1.1.6 --help
```

### Permission denied

```bash
chmod +x rgminer-1.1.6
```

### A GPU must not be used

Select only the required CUDA indices:

```bash
./rgminer-1.1.6 --devices 0,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### CMP handling must be disabled

```bash
./rgminer-1.1.6 --no-cmp-unlock -d 0,1,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### Plain logs are required

Add `--plain-console` to disable the live terminal interface.

---

<a id="resources"></a>

## Resources <sub><a href="#english-contents">↑ Back to contents</a></sub>

- [Official website and web panel](https://rgminer.net/)
- [Releases](https://github.com/Printscan/rgminer/releases)
- [Issues](https://github.com/Printscan/rgminer/issues)
- [Repository](https://github.com/Printscan/rgminer)

When reporting a problem, include the release filename, GPU model, NVIDIA driver version, operating system, complete command with the wallet removed, and the relevant log fragment.

</details>

<a id="russian"></a>

<details>
<summary><strong>Русский</strong></summary>

<a id="russian-contents"></a>

## Оглавление

- [Новое в 1.1.6](#ru-whats-new)
- [Быстрый старт](#ru-quick-start)
- [Алгоритмы](#ru-algorithms)
- [Параметры запуска](#ru-cli-options)
- [Управление памятью](#ru-memory-control)
- [Умный тюн](#ru-smart-tune)
- [Восстановление GPU](#ru-gpu-recovery)
- [Веб-панель](#ru-web-panel)
- [Реферальная система](#ru-referral)
- [API майнера](#ru-miner-api)
- [Применение настроек](#ru-overclock)
- [Параметры CMP](#ru-cmp-options)
- [Решение проблем](#ru-troubleshooting)
- [Ресурсы](#ru-resources)

---

<a id="ru-whats-new"></a>

## Новое в 1.1.6 <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

### Pearl / Pearlhash

- Энергоэффективность увеличена на **3–8%** на RTX 2000–5000 в зависимости от архитектуры.
- Хешрейт увеличен на **2% на RTX 5000** и примерно на **0,4% на остальных архитектурах**.
- Добавлена поддержка **Peryn.ai** и **MaxPool (`maxpool.pro`)**.
- Исправлена передача телеметрии для **Pearl Fortune**.

### Nockchain / Nock-ZK

- Добавлена поддержка трёх пулов: **Gigahash, NockMining и TheFactory**.
- Хешрейт **CMP 170HX** увеличен на **14,5%**.
- Результат CMP 170HX: **34,01 MH/s при 150 Вт**, частоты **1450 МГц по ядру / 600 МГц по памяти**.

### Quantus

- **GTX 16xx / RTX 2000:** хешрейт **+1,7%**.
- **RTX 3000:** хешрейт **+3,5%**.
- **RTX 4000:** хешрейт **+3%**.
- **RTX 5000:** хешрейт **+5%**.

### NOID

- Добавлена поддержка майнинга **NOID**.
- Поддерживаемые Stratum-пулы: **Suprnova, InnovLab и RPlant**.
- Комиссия разработчика: **2%**.
- Хешрейт, потребление и частоты приведены в [таблицах производительности](#performans).

### Улучшения работы с пулами и оптимизация майнера

- Оптимизирована работа при частых переподключениях к пулам. Это уменьшает влияние нестабильного соединения, но не устраняет проблемы на стороне провайдера.
- Снижены **потребление оперативной памяти и нагрузка на процессор**.
- Удалена поддержка **Exfer**.

### Windows

- Исправлен анлок на **мульти-GPU системах**, где ранее возникали ошибки.
- Скорректирован анлок **CMP 40HX и CMP 70HX**.
- Внесены исправления, направленные на поддержку **старых систем**.

---

<a id="ru-quick-start"></a>

## Быстрый старт <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

Сделайте standalone-файл исполняемым и запустите его, указав алгоритм, пул и кошелёк:

```bash
chmod +x rgminer-1.1.6

./rgminer-1.1.6 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name WORKER
```

Несколько резервных пулов указываются в порядке приоритета через запятую:

```bash
./rgminer-1.1.6 \
  --algo pearl \
  --stratum HOST1:PORT1,HOST2:PORT2 \
  --wallet WALLET
```

Для проверяемого TLS используйте `stratum+tls://` или `--stratum-tls`:

```bash
./rgminer-1.1.6 \
  --algo pearl \
  --stratum stratum+tls://HOST:PORT \
  --wallet WALLET
```

Установка и запуск через Docker:

```bash
docker pull palmatorro/rgminer:TAG

docker run -d \
  --gpus all \
  --restart unless-stopped \
  --name rgminer \
  palmatorro/rgminer:TAG \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name docker-rig
```

Замените `TAG` на опубликованный тег образа из [Docker Hub](https://hub.docker.com/r/palmatorro/rgminer). На хосте должны быть установлены рабочий драйвер NVIDIA, Docker и `nvidia-container-toolkit`.

---

<a id="ru-algorithms"></a>

## Алгоритмы <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

| Значение `--algo` | Назначение | Комиссия |
|---|---|---|
| `pearl` | Майнинг Pearl на GPU | 2% |
| `quantus` | Майнинг Quantus на GPU | 2% |
| `nock-zk` | Майнинг Nockchain v5 на GPU | 2% |
| `noid` | Майнинг NOID через Stratum | 2% |

Пример Pearl:

```bash
./rgminer-1.1.6 --algo pearl --stratum HOST:PORT --wallet WALLET
```

Пример Quantus (комиссия 2%):

```bash
./rgminer-1.1.6 --algo quantus --stratum HOST:PORT --wallet WALLET
```

Пример Nockchain (комиссия майнера 2%; комиссия пула [RabbitMiner](https://rabbitminer.cc/) — 2,5%):

```bash
./rgminer-1.1.6 --algo nock-zk --proto rabbit --stratum nl2.rabbitminer.cc:1108 --wallet WALLET --worker-name RIG
```

Пример NOID (Suprnova, InnovLab или RPlant; комиссия 2%):

```bash
./rgminer-1.1.6 --algo noid --stratum HOST:PORT --wallet WALLET
```

---

<a id="ru-cli-options"></a>

## Параметры запуска <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

Ниже описаны параметры запуска `rgminer-1.1.6`.

### Подключение к пулу

| Параметр | Описание |
|---|---|
| `--algo ALGO` | Выбор `pearl`, `quantus`, `nock-zk` или `noid`. |
| `--stratum HOST:PORT[,HOST:PORT]` | Адрес пула или список пулов по приоритету. |
| `--wallet WALLET`, `--address WALLET` | Кошелёк для выплат или имя пользователя пула. |
| `--worker NAME`, `--worker-name NAME` | Имя воркера или рига. |
| `--stratum-pass PASS` | Пароль пула. |
| `--stratum-tls` | Принудительно использовать TLS с проверкой сертификата. |
| `--proto NAME` | Выбрать протокол пула. |

### GPU, API и безопасность

| Параметр | Описание |
|---|---|
| `-d GPU[,GPU]`, `--devices GPU[,GPU]` | Выбор индексов CUDA-устройств. |
| `--token TOKEN` | Подключить майнер к аккаунту официальной веб-панели; её адрес уже встроен. |
| `--api-host HOST` | Адрес API. Используется вместе с `--api-port`. |
| `--api-port PORT` | Порт API. Используется вместе с `--api-host`. |
| `--plain-console` | Отключить интерактивный интерфейс и выводить обычный лог. |
| `--watchdog=off`, `--watchdog=restart`, `--watchdog=reboot` | Политика восстановления GPU. `--smart-tune on` выбирает `reboot`; при другой действующей политике перезагрузка запрещена. |
| `--tune-fan-fix [0-100]` | Зафиксировать вентиляторы на указанном проценте во время autotune; без значения используется 100%. |
| `--mem-control on/off` | Автоматический профиль памяти; по умолчанию `on`. |
| `--smart-tune on/off` | Независимый подбор настроек GPU; по умолчанию `off`. |

<a id="ru-memory-control"></a>

### `--mem-control`

Автоматическое управление памятью теперь **включено по умолчанию**: `--mem-control on`.

- Расширена поддержка режимов памяти **405 / 810 МГц** на GPU, где эти значения раньше были недоступны, в том числе в **Windows**.
- Майнер автоматически выбирает профиль памяти под алгоритм и видеокарту, используя настройку **P-state GPU**.
- При остановке майнер восстанавливает изменённые им настройки.
- Если другой майнер изменил P-state и не вернул настройки, **при обновлении может потребоваться перезагрузка фермы**, чтобы восстановить исходное состояние GPU.

Явные параметры разгона майнера имеют наивысший приоритет. **`--lock-mclock`** переопределяет автоматическую частоту памяти, а **`--mclock`** — автоматический оффсет памяти.

При `--mem-control on` внешние изменения памяти, противоречащие выбранному автоматическому профилю, возвращаются к значениям профиля. Чтобы использовать свои настройки памяти, отключите функцию через `--mem-control off` или задайте значения OC-параметрами майнера.

<a id="ru-smart-tune"></a>

### `--smart-tune`

Добавлен режим **умного даунвольта**, работающий независимо от управления памятью:

- `--smart-tune off` — отключён **по умолчанию**.
- `--smart-tune on` — автоматический подбор настроек каждой GPU.

Тюнер настраивает приватные параметры GPU, выходящие за пределы обычного публичного оффсета и фиксированной частоты ядра. Подбор работает как с фиксом ядра, так и **только с ограничением PL**. При `--mem-control on` перед тюном также выбираются профиль памяти для алгоритма и поддерживаемые настройки внутренних частот чипа.

Подбор идёт итерациями с учётом **ошибок CUDA runtime и статуса восстановления GPU, сообщаемого драйвером**. Точность — **один аппаратный шаг**, соответствующий примерно **5–15 МГц оффсета ядра** в зависимости от архитектуры. Неподдерживаемые приватные механизмы пропускаются; при недоступном GPC используется поддерживаемый путь подбора оффсета ядра.

Обычно тюн занимает **от 30 до 90 минут** в зависимости от стартовых настроек. После завершения подбора ошибки GPU также приводят к пошаговой корректировке настроек в сторону стабильности.

> ⚠️ **Перед включением тюна**
>
> - Не рекомендуется менять частоты во время или после подбора, особенно повышать их. Подобранные приватные настройки относятся к конкретному режиму GPU. Рекомендуемый порядок: **остановить майнер, применить новые настройки и запустить его снова**.
> - Изменение **заданного фикса ядра, фикса памяти или PL** запускает новый тюн для изменившегося режима. Изменения памяти учитываются после применения политики `--mem-control` и явных параметров майнера.
> - При первом запуске используйте **заранее проверенный стабильный публичный оффсет ядра**: он становится стартовым значением тюна и сохраняется в кеше. При наличии подходящего кеша изменение только этого оффсета не заменяет сохранённое стартовое значение и не запускает ретюн.
> - Во время тюна внешнее применение публичного оффсета ядра блокируется. Его сложение с подобранными приватными настройками может вызвать нестабильность GPU вплоть до зависания фермы. После остановки майнера исходный публичный оффсет восстанавливается.
> - Состояние тюна и подобранные настройки сохраняются автоматически, позволяя продолжить работу после перезапуска.

<a id="ru-gpu-recovery"></a>

### Восстановление видеокарт

Способ восстановления зависит от состояния GPU: майнер может **перезапустить отдельный backend, выполнить PCIe FLR reset, попытаться восстановить карту после выпадения из шины или перезагрузить хост при необходимости**.

При некоторых сбоях GPU также блокируется драйвер NVIDIA, ожидающий ответа от устройства. Во время тестов сброс GPU не всегда освобождал такие ожидания. Поэтому **`--smart-tune on` выбирает политику вотчдога `reboot`**, разрешающую перезагрузку системы, если восстановление не завершается. Если действующая политика вотчдога отличается от `reboot`, перезагрузка запрещена.

> ⚠️ **Во время тюна возможны перезапуски отдельных GPU-backend и перезагрузка фермы.** Учитывайте это при выборе времени запуска подбора.

Алгоритм тюна позволяет глубже даунвольтить видеокарты, особенно **RTX 2000, RTX 4000 и RTX 5000**. Для RTX 3000 также доступны настройки за пределами обычного публичного оффсета. Функционал будет дорабатываться — ждём отзывов и результатов тестирования. Дальнейшие улучшения будут направлены на уменьшение необходимости перезагрузок.

Пример включения API:

```bash
./rgminer-1.1.6 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --api-host 127.0.0.1 \
  --api-port 9200
```

---

<a id="ru-web-panel"></a>

## Веб-панель <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

Откройте [rgminer.net](https://rgminer.net/) и создайте регистрационный токен в своём аккаунте. Добавьте его к обычной команде запуска:

```bash
./rgminer-1.1.6 --algo pearl --stratum HOST:PORT --wallet WALLET --token YOUR_TOKEN
```

Адрес официальной панели и ключ проверки сервера уже встроены в этот релиз — указывать отдельный адрес не нужно. Токен показывается только при создании: сразу сохраните его и никому не передавайте. Для майнинга без панели токен не требуется.

В панели доступны состояние ферм, телеметрия GPU в реальном времени и история хешрейта. Можно менять алгоритм, кошелёк, имя воркера, пулы и watchdog, применять профили и настройки GPU ко всем выбранным картам пакетом, а также использовать доступные команды запуска, остановки и перезапуска майнера. Доступ к ферме можно отозвать, даже если она не в сети.


- Расширены способы подключения ферм к веб-панели.
- Улучшен **UI/UX** интерфейса.
- Добавлены **привязка почты** и **двухфакторная аутентификация (2FA)**.

<a id="ru-referral"></a>

## Реферальная система <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

**RGMiner — первый майнер со встроенной реферальной системой.**

Приглашайте друзей и зарабатывайте больше вместе :)

**Принцип работы:**

1. Пользователь переходит по вашей реферальной ссылке и регистрируется в веб-панели.
2. Все фермы, подключённые к его аккаунту, отправляют каждую десятую **dev-шару** на кошелёк, который вы указали в настройках реферальной системы.
3. Для dev-майнинга используется **пул, выбранный приглашённым пользователем**, по аналогии с обычной dev-комиссией. Это помогает избежать дополнительных проблем с подключением к пулам у приглашённого пользователя.

Для подключения фермы добавьте токен с сайта в параметры запуска майнера:

```text
--token "ВАШ_ТОКЕН_С_САЙТА"
```

---

<a id="ru-miner-api"></a>

## API майнера <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

Защищённый релиз по умолчанию предоставляет API статистики в формате JSON на `127.0.0.1:9200`. Launcher объединяет статистику всех выбранных GPU и CUDA backend-процессов.

Адрес и порт можно изменить при запуске:

```bash
./rgminer-1.1.6 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --api-host 127.0.0.1 \
  --api-port 9200
```

### Эндпоинты

| Запрос | Ответ |
|---|---|
| `GET /health` | Состояние API и количество опубликованных записей GPU. |
| `GET /metrics` | Подробная JSON-статистика по каждому GPU. |

```bash
curl -s http://127.0.0.1:9200/health
curl -s http://127.0.0.1:9200/metrics
```

Ответ `/health`:

```json
{"status":"ok","running":1}
```

В защищённом релизе `running` — число записей GPU в текущем агрегированном снимке метрик launcher-процесса. Это подтверждает доступность данных API, но само по себе не гарантирует подключение к пулу, положительный хешрейт или принятые шары.

`/metrics` возвращает массив `miners`. Объект каждого GPU содержит:

| Поля | Значение |
|---|---|
| `deviceId`, `deviceIdScope`, `gpuName`, `pciBusId`, `pid` | Физический GPU и идентификатор backend-процесса. |
| `lastJobId`, `lastHeight`, `algo` | Текущее задание и алгоритм. |
| `emaRate` | Сглаженный хешрейт в исходных `H/s`. Для получения `TH/s` разделите значение на `1e12`. |
| `lastChecked`, `lastStatus`, `lastError` | Счётчик работы, текущее состояние и последняя ошибка. |
| `acceptedShares`, `rejectedShares`, `staleShares`, `foundBlocks` | Счётчики шар и найденных блоков. |
| `lastDifficulty` | Последняя опубликованная сложность. |
| `totalChecked`, `totalElapsedMs` | Накопленный объём работы и время вычислений. |
| `lastUpdated`, `processUptimeMs` | Unix-время обновления и uptime процесса в миллисекундах. |

Вывести основные показатели:

```bash
curl -s http://127.0.0.1:9200/metrics |
  jq '.miners[] | {
    deviceId,
    gpuName,
    emaRate,
    lastStatus,
    acceptedShares,
    rejectedShares
  }'
```

Посчитать суммарный хешрейт в `H/s`:

```bash
curl -s http://127.0.0.1:9200/metrics |
  jq '[.miners[].emaRate] | add // 0'
```

Поддерживается только метод `GET`. Неизвестный путь возвращает `404`, другие методы — `405`, а при превышении 100 запросов за одну секунду API может вернуть `429` и `Retry-After: 1`.

> [!WARNING]
> В API нет аутентификации и TLS. Оставляйте привязку к `127.0.0.1`. Открывайте API в сеть только через firewall, reverse proxy с аутентификацией или VPN.

---

<a id="ru-overclock"></a>

## Применение настроек <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

Параметры частот используют физические индексы NVIDIA GPU и применяются через NVML. Значение без номера GPU применяется ко всем картам, а значение с номером переопределяет его для выбранной карты.

| Параметр | Описание |
|---|---|
| `--cclock OFFSET[,GPU:OFFSET]` | Смещение частоты ядра в МГц. |
| `--mclock OFFSET[,GPU:OFFSET]` | Смещение эффективной частоты памяти в МГц. |
| `--lock-cclock MHz[,GPU:MHz]` | Фиксация абсолютной частоты ядра. |
| `--lock-mclock MHz[,GPU:MHz]` | Фиксация абсолютной частоты памяти. |
| `--pl WATTS[,GPU:WATTS]` | Установка лимита мощности NVIDIA GPU в ваттах через NVML (Linux и Windows). |
| `--fan %[,GPU:FanSpeed]` | Установка скорости куллера GPU (Linux и Windows). |

Пример для нескольких GPU:

```bash
./rgminer-1.1.6 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --cclock 0:125,1:250 \
  --mclock 0:500,1:1000 \
  --lock-cclock 0:1650,1:2450 \
  --lock-mclock 0:7000,1:7000 \
  --pl 0:180,1:220
```

На CMP 170HX `--lock-mclock` и WebUI также управляют регистрами памяти HBM2. Минимальная безопасная применяемая частота памяти — **525 МГц**. Для изменения частот нужны соответствующие разрешения драйвера NVIDIA. Начинайте с безопасных значений и проверяйте каждую карту отдельно.

---

<a id="ru-cmp-options"></a>

## Параметры CMP <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

| Параметр | Описание |
|---|---|
| `--cmp-unlock` | Принудительно установить или повторно включить CMP unlock. |
| `--cmp-unlock-force` | Отключить сторонние переопределения драйвера NVIDIA и установить CMP unlock. |
| `--no-cmp-unlock` | Отключить обработку CMP unlock. |
| `--no-cmp-unlock-update` | Сохранить установленную версию CMP-патча без обновления. |
| `--cmp-blob-source SOURCE` | Указать базовый HTTPS URL или точный файл CMP blob. |
| `--cmp-unlock-uninstall` | Восстановить сохранённый до патча модуль NVIDIA и перезагрузить систему. |
| `--unlock-level-map MAP` | Задать уровни CMP unlock для PCI BDF: `BDF=N[,BDF=N]`. |

Параметры CMP unlock доступны только в Linux. Анлокер CMP 170HX v4 поддерживает драйверы NVIDIA **610.43.02**, **610.57.04** и **615.71.09**. Его обновление запускается автоматически при обновлении майнера. Если вы установили собственный анлок и хотите его сохранить, используйте `--no-cmp-unlock`. При наличии зеркала для загрузки CMP blob используются автоматически.

---

<a id="ru-troubleshooting"></a>

## Решение проблем <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

### Показать справку релиза

```bash
./rgminer-1.1.6 --help
```

### Ошибка Permission denied

```bash
chmod +x rgminer-1.1.6
```

### Нужно исключить GPU

Укажите только необходимые CUDA-индексы:

```bash
./rgminer-1.1.6 --devices 0,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### Нужно отключить обработку CMP

```bash
./rgminer-1.1.6 --no-cmp-unlock -d 0,1,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### Нужен обычный текстовый лог

Добавьте `--plain-console`, чтобы отключить интерактивный терминальный интерфейс.

---

<a id="ru-resources"></a>

## Ресурсы <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

- [Официальный сайт и веб-панель](https://rgminer.net/)
- [Релизы](https://github.com/Printscan/rgminer/releases)
- [Сообщить о проблеме](https://github.com/Printscan/rgminer/issues)
- [Репозиторий](https://github.com/Printscan/rgminer)

При сообщении об ошибке укажите имя релизного файла, модель GPU, версию драйвера NVIDIA, операционную систему, полную команду без кошелька и относящийся к проблеме фрагмент лога.

</details>
