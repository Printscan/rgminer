# rgminer

CUDA miner with HiveOS and MMPOS integration.

Current release: `v0.9.9`

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

## Download

HiveOS custom miner package:

```text
https://github.com/Printscan/rgminer/releases/download/v0.9.9/rgminer-0.9.9.tar.gz
```

MMPOS package:

```text
https://github.com/Printscan/rgminer/releases/download/v0.9.9/rgminer-0.9.9-mmpos.tar.gz
```

Standalone launcher:

```text
https://github.com/Printscan/rgminer/releases/download/v0.9.9/rgminer-0.9.9
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
      "wal_id": 11039470,
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "rgminer",
      "miner_config": {
        "url": "HOST:PORT",
        "miner": "rgminer",
        "template": "%WAL%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v0.9.9/rgminer-0.9.9.tar.gz",
        "user_config": "--algo pearl --proto akoyav2"
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

Clock settings are applied directly through NVML and require sufficient NVIDIA
driver permissions.

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

## Tested

- HiveOS CUDA 12 path with NVIDIA driver `550.144.03`.
- CUDA 12.4 backends for Turing, Ampere and Ada.
- CUDA 12.8 backend for Blackwell.
