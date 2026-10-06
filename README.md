<div align="center">
  <img src="https://github.com/user-attachments/assets/326320f2-f0f8-4978-bbfe-2c28da2ae56a" alt="RGminer" width="500" />
</div>

<p align="center">
  <a href="https://rgminer.net/"><img alt="Official website and web panel: rgminer.net" src="https://img.shields.io/badge/Website-rgminer.net-ff743d?style=for-the-badge" width="250" height="40" /></a><a href="https://t.me/rgpool"><img alt="Telegram: @rgpool" src="https://img.shields.io/badge/Telegram-@rgpool-229ED9?style=for-the-badge&amp;logo=telegram&amp;logoColor=white" width="250" height="40" /></a>
</p>

<p align="center">
  <a href="https://github.com/Printscan/rgminer/releases"><img alt="Release" src="https://img.shields.io/badge/release-v1.1.2-2ea44f"></a>
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
    <tr><td>EXFER</td><td><code>exfer-argon2id</code></td><td>Argon2id</td><td>5%</td></tr>
  </tbody>
</table>

<a id="performans"></a>

## PERFORMANCE / ПРОИЗВОДИТЕЛЬНОСТЬ

<details>
<summary><strong>Pearl</strong></summary>

| GPU | Hashrate | Power, W | Core Offset | Core, MHz | Memory, MHz | Mem offset | Efficiency, MH/W |
|---|---:|---:|---:|---:|---:|---:|---:|
| Tesla V100-SXM2-16GB | **37.70** | **215** | — | 1350 | — | — | **0.175** |
| CMP 40HX | **52.60** | **139.12** | 255 | 1650 | 5000 | — | **0.378** |
| RTX 2080 | **75.47** | **178.59** | 135 | 1650 | 5000 | — | **0.423** |
| CMP 50HX | **90.50** | **220.88** | 255 | 1650 | 5000 | — | **0.410** |
| CMP 70HX | **46.90** | **142.58** | 255 | 1650 | — | -2000 | **0.329** |
| RTX 3060 Ti | **62.12** | **130.85** | 255 | 1650 | 5000 | — | **0.475** |
| RTX 3070m | **65.84** | **118.95** | 255 | 1650 | 6000 | — | **0.554** |
| RTX 3070 | **75.69** | **146.40** | 255 | 1650 | 5000 | — | **0.517** |
| CMP 90HX | **71.80** | **189.83** | 300 | 1650 | — | -2000 | **0.378** |
| RTX 3080 Ti | **130.30** | **274.50** | 255 | 1650 | 5000 | — | **0.475** |
| CMP 170HX | **185.00** | **209.58** | 300 | 1455 | — | 0 | **0.883** |
| RTX 4070 Ti | **145.50** | **162** | 345 | 2445 | 5000 | — | **0.898** |
| RTX 4090 | **296.05** | **308.40** | 315 | 2445 | 5000 | — | **0.960** |
| RTX 5070 Ti | **171.40** | **177.10** | 480 | 2445 | 7000 | — | **0.968** |

</details>

<details>
<summary><strong>Quantus</strong></summary>

| GPU | Hashrate, MH/s | Power, W | Core Offset | Core, MHz | Memory, MHz | Mem offset | Efficiency, MH/W |
|---|---:|---:|---:|---:|---:|---:|---:|
| P104-100 | **49.06** | **87.94** | 150 | 1650 | — | -2000 | **0.558** |
| CMP 100-100 | **68.44** | **189.7** | — | 1455 | 837 | — | **0.361** |
| GTX 1660 Super | **140.42** | **64.51** | 150 | 1650 | 810 | 0 | **2.177** |
| GTX 1660 Ti | **153.59** | **56.32** | 150 | 1650 | 810 | 0 | **2.727** |
| RTX 2060 | **192.29** | **84.99** | 210 | 1650 | 810 | 0 | **2.263** |
| RTX 2070 | **228.53** | **99.33** | 200 | 1650 | 810 | 0 | **2.301** |
| RTX 2080 | **293** | **128** | 115 | 1650 | 810 | 0 | **2.289** |
| CMP 50HX | **357.96** | **179.20** | 250 | 1650 | 5000 | 0 | **1.998** |
| RTX 3060 Ti | **249.54** | **85** | 300 | 1650 | 810 | 0 | **2.936** |
| RTX 3070m | **262.65** | **72** | 250 | 1650 | 810 | 0 | **3.648** |
| RTX 3070 | **301.76** | **97** | 300 | 1650 | 810 | 0 | **3.111** |
| RTX 3080 | **443.17** | **155** | 300 | 1650 | 810 | 0 | **2.859** |
| RTX 3080 Ti | **519.27** | **179** | 300 | 1650 | 810 | 0 | **2.901** |
| CMP 90HX | **328.39** | **173** | 300 | 1650 | — | -2000 | **1.898** |
| RTX 4070 Ti | **578** | **150** | 300 | 2460 | 810 | 0 | **3.853** |
| RTX 4090 | **1234.00** | **332.99** | 315 | 2460 | 810 | 0 | **3.706** |
| RTX 5070 Ti | **646.43** | **165** | 499 | 2460 | 810 | 0 | **3.918** |

</details>

<details>
<summary><strong>Nock-ZK</strong></summary>

| GPU | Hashrate, MH/s | Power, W | Core Offset | Core, MHz | Memory, MHz | Mem offset | Efficiency, MH/W |
|---|---:|---:|---:|---:|---:|---:|---:|
| RTX 2080 | **22.49** | **164** | 115 | 1650 | 5000 | 0 | **0.137** |
| CMP 50HX | **26.62** | **210** | 250 | 1650 | 5000 | 0 | **0.127** |
| RTX 3060 Ti | **18.94** | **125** | 300 | 1650 | 810 | 0 | **0.152** |
| RTX 3070m | **19.95** | **82** | 250 | 1650 | 5000 | 0 | **0.243** |
| RTX 3070 | **22.93** | **140** | 300 | 1650 | 5000 | 0 | **0.164** |
| RTX 3080 Ti | **39.9** | **255** | 300 | 1650 | 5000 | 0 | **0.156** |
| CMP 90HX | **24.8** | **190** | 300 | 1650 | — | -2000 | **0.131** |
| RTX 4070 Ti | **44.67** | **177.5** | 300 | 2460 | 5000 | 0 | **0.252** |
| RTX 4090 | **94.45** | **379** | 315 | 2460 | 5000 | 0 | **0.249** |
| RTX 5070 Ti | **55.36** | **198** | 499 | 2460 | 5000 | 0 | **0.280** |

</details>

---

<a id="hiveos"></a>

## HIVEOS

<details>
<summary><strong>Pearl</strong></summary>

<p align="center">
  <img
    src="https://github.com/user-attachments/assets/eee09018-fda1-411b-8df5-a53106e7e674"
    alt="rgminer"
    width="100%"
  />
</p>

```json
{
  "isFavorite": false,
  "items": [
    {
      "coin": "pearl",
      "pool_ssl": false,
      "wal_id": 11121164,
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "rgminer",
      "miner_config": {
        "url": "YOUR_POOL",
        "algo": "pearlhash",
        "miner": "rgminer",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v1.1.2/rgminer-1.1.2-hiveos.tar.gz"
      },
      "pool_geo": []
    }
  ]
}
```

</details>

<details>
<summary><strong>Quantus</strong></summary>

<p align="center">
  <img
    src="https://github.com/user-attachments/assets/47f3db3e-78ca-4ab0-a258-d2347c949b7a"
    alt="rgminer"
    width="100%"
  />
</p>

```json
{
  "isFavorite": false,
  "items": [
    {
      "coin": "quantus",
      "pool_ssl": false,
      "wal_id": 11121164,
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "rgminer",
      "miner_config": {
        "url": "YOUR_POOL",
        "algo": "quantus",
        "miner": "rgminer",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v1.1.2/rgminer-1.1.2-hiveos.tar.gz"
      },
      "pool_geo": []
    }
  ]
}
```

</details>

<details>
<summary><strong>Nock-ZK</strong></summary>

<div align="left">
<img src="https://github.com/user-attachments/assets/ce168909-4a32-4a59-b8f9-84b181cd9584" alt="rgminer" width="50%" />
</div>

```json
{
  "isFavorite": false,
  "items": [
    {
      "coin": "NOCK",
      "pool_ssl": false,
      "wal_id": 11121164,
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "rgminer",
      "miner_config": {
        "url": "nl2.rabbitminer.cc:1108",
        "miner": "rgminer",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v1.1.2/rgminer-1.1.2-hiveos.tar.gz",
        "user_config":"--algo nock-zk"
      },
      "pool_geo": []
    }
  ]
}
```

</details>

---

| Platform | Release file |
|---|---|
| Linux standalone | [`rgminer-1.1.2`](https://github.com/Printscan/rgminer/releases/download/v1.1.2/rgminer-1.1.2) |
| Windows | [`rgminer-1.1.2-windows.zip`](https://github.com/Printscan/rgminer/releases/download/v1.1.2/rgminer-1.1.2-windows.zip) |
| HiveOS | [`rgminer-1.1.2-hiveos.tar.gz`](https://github.com/Printscan/rgminer/releases/download/v1.1.2/rgminer-1.1.2-hiveos.tar.gz) |
| MMPOS | [`rgminer-1.1.2-mmpos.tar.gz`](https://github.com/Printscan/rgminer/releases/download/v1.1.2/rgminer-1.1.2-mmpos.tar.gz) |
| Docker | [`palmatorro/rgminer:1.1.2`](https://hub.docker.com/r/palmatorro/rgminer) |

---

<a id="miner-settings"></a>

## MINER SETTINGS / НАСТРОЙКИ МАЙНЕРА
<a id="english"></a>

<details>
<summary><strong>English</strong></summary>

<a id="english-contents"></a>

## Contents

- [Quick Start](#quick-start)
- [Algorithms](#algorithms)
- [CLI Options](#cli-options)
- [Web Panel](#web-panel)
- [Miner API](#miner-api)
- [Overclock](#overclock)
- [CMP Options](#cmp-options)
- [Troubleshooting](#troubleshooting)
- [Resources](#resources)

---

<a id="quick-start"></a>

## Quick Start <sub><a href="#english-contents">↑ Back to contents</a></sub>

Make the standalone Linux release executable and start it with an algorithm, pool and wallet:

```bash
chmod +x rgminer-1.1.2

./rgminer-1.1.2 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name WORKER
```

Several pools can be specified in priority order:

```bash
./rgminer-1.1.2 \
  --algo pearl \
  --stratum HOST1:PORT1,HOST2:PORT2 \
  --wallet WALLET
```

Use `stratum+tls://` or `--stratum-tls` to enable verified TLS:

```bash
./rgminer-1.1.2 \
  --algo pearl \
  --stratum stratum+tls://HOST:PORT \
  --wallet WALLET
```

Docker installation and launch:

```bash
docker pull palmatorro/rgminer:1.1.2

docker run -d \
  --gpus all \
  --restart unless-stopped \
  --name rgminer \
  palmatorro/rgminer:1.1.2 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name docker-rig
```

The host must have a working NVIDIA driver, Docker and `nvidia-container-toolkit`.

---

<a id="algorithms"></a>

## Algorithms <sub><a href="#english-contents">↑ Back to contents</a></sub>

| `--algo` value | Purpose | Dev fee |
|---|---|---|
| `pearl` | Pearl GPU mining | 2% |
| `quantus` | Quantus GPU mining | 2% |
| `nock-zk` | Nockchain v5 GPU mining via RabbitMiner | 2% |
| `exfer`, `exfer-argon2id` | EXFER Argon2id Stratum mining | 5% |

Pearl example:

```bash
./rgminer-1.1.2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

Quantus example (2% dev fee):

```bash
./rgminer-1.1.2 --algo quantus --stratum HOST:PORT --wallet WALLET
```

Nockchain example (2% miner fee; [RabbitMiner](https://rabbitminer.cc/) pool fee 2.5%):

```bash
./rgminer-1.1.2 --algo nock-zk --proto rabbit --stratum nl2.rabbitminer.cc:1108 --wallet WALLET --worker-name RIG
```

EXFER example:

```bash
./rgminer-1.1.2 --algo exfer-argon2id --stratum HOST:PORT --wallet WALLET
```

---

<a id="cli-options"></a>

## CLI Options <sub><a href="#english-contents">↑ Back to contents</a></sub>

The table below describes the `rgminer-1.1.2` command-line options.

### Pool connection

| Option | Description |
|---|---|
| `--algo ALGO` | Select `pearl`, `quantus`, `nock-zk`, `exfer-argon2id` or the `exfer` alias. |
| `--stratum HOST:PORT[,HOST:PORT]` | Pool endpoint or a priority-ordered pool list. Other algorithms support `stratum+tls://`; Nock-ZK uses TCP. |
| `--proto rabbit` | RabbitMiner pool protocol for Nock-ZK; selected by default for this algorithm. |
| `--wallet WALLET`, `--address WALLET` | Payout wallet or pool user. |
| `--worker NAME`, `--worker-name NAME` | Worker or rig name. |
| `--stratum-pass PASS` | Pool password. |
| `--stratum-tls` | Force verified TLS for Stratum. |
| `--proto NAME` | Select a non-default Pearl pool protocol: `alphapool`, `herominers`, `kryptex`, `f2pool`, `pearlfortune` or `suprnova`. Omit the option for automatic AkoyaV2. |

### GPU, API and safety

| Option | Description |
|---|---|
| `-d GPU[,GPU]`, `--devices GPU[,GPU]` | Select CUDA device indices. |
| `--token TOKEN` | Connect to your account on the official web panel; its address is built in. |
| `--api-host HOST` | API listener address. Use with `--api-port`. |
| `--api-port PORT` | API listener port. Use with `--api-host`. |
| `--plain-console` | Disable the live console UI and print plain log output. |
| `--watchdog=off`, `--watchdog=restart`, `--watchdog=reboot` | Select no recovery, miner restart or rig reboot after a CUDA failure. |
| `--tune-fan-fix [0-100]` | Hold fans at a fixed percentage during autotune; bare flag means 100%. |

API example:

```bash
./rgminer-1.1.2 \
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
./rgminer-1.1.2 --algo pearl --stratum HOST:PORT --wallet WALLET --token YOUR_TOKEN
```

The official panel address and its server trust anchor are built into this release; no extra panel address is needed. The token is displayed only when created, so copy it then and keep it private. Mining without the panel does not require a token.

The panel shows rig status, live GPU telemetry and hashrate history. You can edit the algorithm, wallet, worker, pools and watchdog, apply GPU profiles and per-card settings as a batch, and use available miner start, stop or restart controls. A rig's panel access can be revoked even while it is offline.

---

<a id="miner-api"></a>

## Miner API <sub><a href="#english-contents">↑ Back to contents</a></sub>

The protected release exposes a read-only JSON API on `127.0.0.1:9200` by default. The launcher aggregates statistics from all selected GPUs and CUDA backend processes.

Change the listener address or port when starting the miner:

```bash
./rgminer-1.1.2 \
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

Clock options use physical NVIDIA GPU indices and are applied through NVML. A value without a GPU index applies to all GPUs; indexed values override it for the selected GPU. Fixed-clock settings use a zero offset when no offset is specified.

| Option | Description |
|---|---|
| `--cclock OFFSET[,GPU:OFFSET]` | Graphics clock offset in MHz. |
| `--mclock OFFSET[,GPU:OFFSET]` | Memory transfer-rate offset in MHz. |
| `--lock-cclock MHz[,GPU:MHz]` | Lock the graphics clock to an absolute value. |
| `--lock-mclock MHz[,GPU:MHz]` | Lock the memory clock to an absolute value. |
| `--pl WATTS[,GPU:WATTS]` | Set the NVIDIA GPU power limit in watts through NVML (Linux and Windows). |

Multi-GPU example:

```bash
./rgminer-1.1.2 \
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
./rgminer-1.1.2 --help
```

### Permission denied

```bash
chmod +x rgminer-1.1.2
```

### A GPU must not be used

Select only the required CUDA indices:

```bash
./rgminer-1.1.2 --devices 0,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### CMP handling must be disabled

```bash
./rgminer-1.1.2 --no-cmp-unlock -d 0,1,2 --algo pearl --stratum HOST:PORT --wallet WALLET
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

- [Быстрый старт](#ru-quick-start)
- [Алгоритмы](#ru-algorithms)
- [Параметры запуска](#ru-cli-options)
- [Веб-панель](#ru-web-panel)
- [API майнера](#ru-miner-api)
- [Применение настроек](#ru-overclock)
- [Параметры CMP](#ru-cmp-options)
- [Решение проблем](#ru-troubleshooting)
- [Ресурсы](#ru-resources)

---

<a id="ru-quick-start"></a>

## Быстрый старт <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

Сделайте standalone-файл исполняемым и запустите его, указав алгоритм, пул и кошелёк:

```bash
chmod +x rgminer-1.1.2

./rgminer-1.1.2 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name WORKER
```

Несколько резервных пулов указываются в порядке приоритета через запятую:

```bash
./rgminer-1.1.2 \
  --algo pearl \
  --stratum HOST1:PORT1,HOST2:PORT2 \
  --wallet WALLET
```

Для проверяемого TLS используйте `stratum+tls://` или `--stratum-tls`:

```bash
./rgminer-1.1.2 \
  --algo pearl \
  --stratum stratum+tls://HOST:PORT \
  --wallet WALLET
```

Установка и запуск через Docker:

```bash
docker pull palmatorro/rgminer:1.1.2

docker run -d \
  --gpus all \
  --restart unless-stopped \
  --name rgminer \
  palmatorro/rgminer:1.1.2 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name docker-rig
```

На хосте должны быть установлены рабочий драйвер NVIDIA, Docker и `nvidia-container-toolkit`.

---

<a id="ru-algorithms"></a>

## Алгоритмы <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

| Значение `--algo` | Назначение | Комиссия |
|---|---|---|
| `pearl` | Майнинг Pearl на GPU | 2% |
| `quantus` | Майнинг Quantus на GPU | 2% |
| `nock-zk` | Майнинг Nockchain v5 на GPU через RabbitMiner | 2% |
| `exfer`, `exfer-argon2id` | Майнинг EXFER Argon2id через Stratum | 5% |

Пример Pearl:

```bash
./rgminer-1.1.2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

Пример Quantus (комиссия 2%):

```bash
./rgminer-1.1.2 --algo quantus --stratum HOST:PORT --wallet WALLET
```

Пример Nockchain (комиссия майнера 2%; комиссия пула [RabbitMiner](https://rabbitminer.cc/) — 2,5%):

```bash
./rgminer-1.1.2 --algo nock-zk --proto rabbit --stratum nl2.rabbitminer.cc:1108 --wallet WALLET --worker-name RIG
```

Пример EXFER:

```bash
./rgminer-1.1.2 --algo exfer-argon2id --stratum HOST:PORT --wallet WALLET
```

---

<a id="ru-cli-options"></a>

## Параметры запуска <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

Ниже описаны параметры запуска `rgminer-1.1.2`.

### Подключение к пулу

| Параметр | Описание |
|---|---|
| `--algo ALGO` | Выбор `pearl`, `quantus`, `nock-zk`, `exfer-argon2id` или псевдонима `exfer`. |
| `--stratum HOST:PORT[,HOST:PORT]` | Адрес пула или список пулов по приоритету. `stratum+tls://` поддерживается для других алгоритмов; Nock-ZK использует TCP. |
| `--proto rabbit` | Протокол RabbitMiner для Nock-ZK; выбран по умолчанию для этого алгоритма. |
| `--wallet WALLET`, `--address WALLET` | Кошелёк для выплат или имя пользователя пула. |
| `--worker NAME`, `--worker-name NAME` | Имя воркера или рига. |
| `--stratum-pass PASS` | Пароль пула. |
| `--stratum-tls` | Принудительно использовать TLS с проверкой сертификата. |
| `--proto NAME` | Выбрать нестандартный протокол пула Pearl: `alphapool`, `herominers`, `kryptex`, `f2pool`, `pearlfortune` или `suprnova`. Для автоматического AkoyaV2 параметр не указывается. |

### GPU, API и безопасность

| Параметр | Описание |
|---|---|
| `-d GPU[,GPU]`, `--devices GPU[,GPU]` | Выбор индексов CUDA-устройств. |
| `--token TOKEN` | Подключить майнер к аккаунту официальной веб-панели; её адрес уже встроен. |
| `--api-host HOST` | Адрес API. Используется вместе с `--api-port`. |
| `--api-port PORT` | Порт API. Используется вместе с `--api-host`. |
| `--plain-console` | Отключить интерактивный интерфейс и выводить обычный лог. |
| `--watchdog=off`, `--watchdog=restart`, `--watchdog=reboot` | Не восстанавливаться, перезапустить майнер или перезагрузить риг после ошибки CUDA. |
| `--tune-fan-fix [0-100]` | Зафиксировать вентиляторы на указанном проценте во время autotune; без значения используется 100%. |

Пример включения API:

```bash
./rgminer-1.1.2 \
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
./rgminer-1.1.2 --algo pearl --stratum HOST:PORT --wallet WALLET --token YOUR_TOKEN
```

Адрес официальной панели и ключ проверки сервера уже встроены в этот релиз — указывать отдельный адрес не нужно. Токен показывается только при создании: сразу сохраните его и никому не передавайте. Для майнинга без панели токен не требуется.

В панели доступны состояние ферм, телеметрия GPU в реальном времени и история хешрейта. Можно менять алгоритм, кошелёк, имя воркера, пулы и watchdog, применять профили и настройки GPU ко всем выбранным картам пакетом, а также использовать доступные команды запуска, остановки и перезапуска майнера. Доступ к ферме можно отозвать, даже если она не в сети.

---

<a id="ru-miner-api"></a>

## API майнера <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

Защищённый релиз по умолчанию предоставляет API статистики в формате JSON на `127.0.0.1:9200`. Launcher объединяет статистику всех выбранных GPU и CUDA backend-процессов.

Адрес и порт можно изменить при запуске:

```bash
./rgminer-1.1.2 \
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

Параметры частот используют физические индексы NVIDIA GPU и применяются через NVML. Значение без номера GPU применяется ко всем картам, а значение с номером переопределяет его для выбранной карты. Для фиксированных частот при отсутствии offset автоматически используется нулевой offset.

| Параметр | Описание |
|---|---|
| `--cclock OFFSET[,GPU:OFFSET]` | Смещение частоты ядра в МГц. |
| `--mclock OFFSET[,GPU:OFFSET]` | Смещение эффективной частоты памяти в МГц. |
| `--lock-cclock MHz[,GPU:MHz]` | Фиксация абсолютной частоты ядра. |
| `--lock-mclock MHz[,GPU:MHz]` | Фиксация абсолютной частоты памяти. |
| `--pl WATTS[,GPU:WATTS]` | Установка лимита мощности NVIDIA GPU в ваттах через NVML (Linux и Windows). |

Пример для нескольких GPU:

```bash
./rgminer-1.1.2 \
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
./rgminer-1.1.2 --help
```

### Ошибка Permission denied

```bash
chmod +x rgminer-1.1.2
```

### Нужно исключить GPU

Укажите только необходимые CUDA-индексы:

```bash
./rgminer-1.1.2 --devices 0,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### Нужно отключить обработку CMP

```bash
./rgminer-1.1.2 --no-cmp-unlock -d 0,1,2 --algo pearl --stratum HOST:PORT --wallet WALLET
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
