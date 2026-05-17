# rgminer

CUDA miner with HiveOS custom miner integration.

Current release: `v0.8.0`

## Supported Algorithms

| Algo | Coin / pool mode | Main command |
|---|---|---|
| `pearl` | Pearl on Akoya Pool and Pearl candidate pools | `--algo pearl --stratum HOST:PORT --wallet WALLET` |
| `exfer-argon2id` | EXFER / Argon2id stratum pools | `--algo exfer-argon2id --stratum HOST:PORT --wallet WALLET` |
| `memhash` | Vecno / MemHash coordinator or stratum-compatible mode | `--algo memhash --host HOST --port PORT --wallet WALLET` |
| `blake2b` | Blake2b offline/network mode | `--algo blake2b ...` |

List algorithms supported by the binary:

```bash
./rgminer --list-algos
```

## Download

HiveOS custom miner package:

```text
https://github.com/Printscan/rgminer/releases/download/v0.8.0/rgminer-0.8.0.tar.gz
```

The package uses a dual backend launcher:

- CUDA 12 backend for current HiveOS / NVIDIA 550 driver deployments.
- CUDA 13 backend for newer systems.

## Common Pool Format

For pool-based coins, prefer the common format:

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

## Pearl / Akoya

Pearl is the recommended `v0.8.0` path. It uses the official Akoya submit protocol and a Tensor-Core optimized scanner.

```bash
./rgminer \
  --algo pearl \
  --stratum pool.akoyapool.com:3333 \
  --wallet <your PRL wallet> \
  --worker-name <worker>
```

Pearl overlap lanes are enabled by default. Manual override:

```bash
RGM_PEARL_GPU_LANES=1 ./rgminer --algo pearl --stratum pool.akoyapool.com:3333 --wallet <wallet>
RGM_PEARL_GPU_LANES=2 ./rgminer --algo pearl --stratum pool.akoyapool.com:3333 --wallet <wallet>
```

Useful Pearl options:

```bash
--pearl-protocol auto|akoya|candidate
--pearl-tuner auto|cache|fixed
--pearl-kernel split128|group8|group4|group2|group1|m64|m256|seq256|chunksh|owner2|split64|split32|split16|shared256
--pearl-batch N
--pearl-retune
--pearl-batch-log=on
```

## EXFER / Argon2id

LuckyPool example:

```bash
./rgminer \
  --algo exfer-argon2id \
  --stratum stratum+tls://exfer.luckypool.io:3336 \
  --wallet solo:<wallet> \
  --worker-name <worker>
```

EXFER tuning options:

```bash
--exfer-autotune-on-start
--exfer-lanes N
--exfer-threads-per-lane 32|64|128|256|512
--exfer-fill-mode coop|warpstore
--exfer-tune-fill-mode
--exfer-continuous-window-ms N
```

## Vecno / MemHash

Coordinator/network example:

```bash
./rgminer \
  --algo memhash \
  --host <coordinator-host> \
  --port <coordinator-port> \
  --wallet <wallet> \
  --worker-name <worker>
```

MemHash split options:

```bash
--split-tune
--pipelines N
--pipelines-map "0=2,1=4"
--split-tuner auto|bench|score|cache|fixed
--split-block N
--split-mix 0|1
```
## HiveOS Custom Miner

Use this install URL:

```text
https://github.com/Printscan/rgminer/releases/download/v0.8.0/rgminer-0.8.0.tar.gz
```

### Pearl / Akoya HiveOS JSON

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
        "url": "pool.akoyapool.com:3333",
        "miner": "rgminer",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v0.8.0/rgminer-0.8.0.tar.gz",
        "user_config": "--algo pearl"
      },
      "pool_geo": []
    }
  ]
}
```

### HiveOS Algo Selection Rule

The miner launch algorithm is selected by `--algo` if it is present in Extra config arguments.

The HiveOS flight sheet `Hash algorithm` value is kept for stats display. This allows using a custom display coin while launching the actual miner with:

```text
--algo pearl
```

## General GPU / Safety Options

```bash
--watchdog=on|off
--no-watchdog
--low-cpu=on|off
--low-cpu-wait-ms N
--tune-cache-file <path>
```

Low CPU mode example:

```bash
./rgminer --algo pearl --stratum pool.akoyapool.com:3333 --wallet <wallet> --low-cpu=on --low-cpu-wait-ms 2
```

## Tested

- NVIDIA driver: `550.144.03`
- CUDA runtime: CUDA 12 backend on HiveOS NVIDIA 550 deployments
- Pearl / Akoya: RTX 3070 Laptop GPU, multi-GPU mode
