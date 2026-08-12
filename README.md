# rgminer

CUDA miner with HiveOS and MMPOS integration.

Current release: `v1.0.1`

## Supported Algorithms

| Algo | Coin / pool mode | Dev fee | Main command |
|---|---|---:|---|
| `pearl` | Pearl Stratum pools | 2% | `--algo pearl --stratum HOST:PORT --wallet WALLET` |
| `exfer-argon2id` | EXFER / Argon2id Stratum pools | 5% | `--algo exfer-argon2id --stratum HOST:PORT --wallet WALLET` |
| `memhash` | Vecno / MemHash Stratum pools | 0% | `--algo memhash --stratum HOST:PORT --wallet WALLET` |

List algorithms supported by the binary:

```bash
./rgminer --list-algos
```
## Pearl Performance

| GPU | Architecture | Core Offset | Fix Core | Fix Mem | Mem Offset | Hashrate | Power | Efficiency |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| RTX 2080 | Turing | 125 | 1650 | 5000 | — | **49.2 TH/s** | **175 W** | **0.281 TH/W** |
| CMP 50HX | Turing | 250 | 1650 | 5000 | — | **58.3 TH/s** | **205 W** | **0.284 TH/W** |
| RTX 3070m | Ampere | 250 | 1650 | 6000 | — | **65.3 TH/s** | **140 W** | **0.466 TH/W** |
| RTX 3070 | Ampere | 250 | 1650 | 5000 | — | **75.4 TH/s** | **165 W** | **0.457 TH/W** |
| CMP 90HX | Ampere | 300 | 1650 | — | -2000 | **68.5 TH/s** | **240 W** | **0.285 TH/W** |
| CMP 170HX | Ampere | 300 | 1455 | — | 0 | **173 TH/s** | **240 W** | **0.721 TH/W** |
| RTX 4070 Ti | Ada | 350 | 2445 | 5000 | — | **145.3 TH/s** | **190 W** | **0.765 TH/W** |
| RTX 4090 | Ada | 315 | 2445 | 5000 | — | **297 TH/s** | **410 W** | **0.724 TH/W** |
| RTX 5070 Ti | Blackwell | 490 | 2445 | 7000 | — | **159.7 TH/s** | **214 W** | **0.746 TH/W** |

## Download

HiveOS custom miner package:

```text
https://github.com/Printscan/rgminer/releases/download/v1.0.1/rgminer-1.0.1.tar.gz
```

MMPOS package:

```text
https://github.com/Printscan/rgminer/releases/download/v1.0.1/rgminer-1.0.1-mmpos.tar.gz
```

Windows package:

```text
https://github.com/Printscan/rgminer/releases/download/v1.0.0/rgminer-1.0.0-windows.zip
```

Standalone launcher:

```text
https://github.com/Printscan/rgminer/releases/download/v1.0.1/rgminer-1.0.1
```

The release package selects the backend for the detected GPU architecture:

- CUDA 12.4 for Turing, Ampere and Ada GPUs.
- CUDA 12.8 for Blackwell GPUs.

## Common Pool Format

For pool-based coins, use:

```bash
./rgminer --algo COIN --stratum HOST:PORT --wallet WALLET --worker-name WORKER
```

Multiple pools can be passed as a comma-separated list:

```bash
./rgminer --algo COIN --stratum HOST1:PORT1,HOST2:PORT2 --wallet WALLET
```

TLS endpoints are accepted with a scheme:

```bash
./rgminer --algo COIN --stratum stratum+tls://HOST:PORT --wallet WALLET
```

`--wallet` is the preferred option. `--address` is accepted as a legacy alias.
`--worker` and `--worker-name` are equivalent.

## Pearl

```bash
./rgminer \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name WORKER \
  --proto akoyav2
```

Pearl options available in the release:

```text
--proto akoyav2|alphapool|herominers|kryptex|f2pool|pearlfortune
--pearl-protocol PROTOCOL
--pearl-share-diff N|off
--pearl-kernel turing|ampere|ada|blackwell
--pearl-reconnect-max-ms MS
```

## EXFER / Argon2id

LuckyPool example:

```bash
./rgminer \
  --algo exfer-argon2id \
  --stratum stratum+tls://exfer.luckypool.io:3336 \
  --wallet solo:WALLET \
  --worker-name WORKER
```

## Vecno / MemHash

```bash
./rgminer \
  --algo memhash \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name WORKER
```

## HiveOS Custom Miner

Use this install URL:

```text
https://github.com/Printscan/rgminer/releases/download/v0.9.9/rgminer-0.9.9.tar.gz
```

### Pearl HiveOS JSON

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
        "url": "prl.kryptex.network:7048",
        "algo": "pearlhash",
        "miner": "rgminer",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v1.0.1/rgminer-1.0.1.tar.gz"
      },
      "pool_geo": []
    }
  ]
}
```

## GPU Selection and Clock Control

Select CUDA devices:

```text
-d GPU[,GPU]
--devices GPU[,GPU]
```

Clock options accept multiple physical NVIDIA GPU indices in the format
`GPU_INDEX:VALUE,GPU_INDEX:VALUE`:

```text
--cclock GPU:OFFSET       Core clock offset in MHz
--mclock GPU:OFFSET       Memory clock offset in MHz
--lock-cclock GPU:MHz     Fixed core clock
--lock-mclock GPU:MHz     Fixed memory clock
```

Multi-GPU example:

```bash
./rgminer \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --cclock 0:125,1:250 \
  --mclock 0:500,1:1000 \
  --lock-cclock 0:1650,1:2450 \
  --lock-mclock 0:7000,1:7000
```

## General GPU / Safety Options

```text
--watchdog=off|restart|reboot
--low-cpu=on|off
--low-cpu-wait-ms N
--api-host HOST
--api-port PORT
--plain-console
```

The default watchdog policy is `restart`.

Low CPU mode example:

```bash
./rgminer --algo pearl --stratum HOST:PORT --wallet WALLET --low-cpu=on --low-cpu-wait-ms 2
```
