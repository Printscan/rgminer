<div align="center">
  <h1 align="center">RGminer</h1>
</div>

<p align="center">
  <a href="https://github.com/Printscan/rgminer/releases"><img alt="Release" src="https://img.shields.io/badge/release-v1.0.3-2ea44f"></a>
  <a href="#download"><img alt="Platforms" src="https://img.shields.io/badge/platforms-Linux%20%7C%20Windows%20%7C%20Docker-blue"></a>
  <a href="#overview"><img alt="GPU" src="https://img.shields.io/badge/GPU-NVIDIA-76b900"></a>
  <a href="#cli-options"><img alt="CUDA" src="https://img.shields.io/badge/backend-CUDA-76b900"></a>
</p>

<a id="contents"></a>

## Contents / Оглавление / 目录

- [PEARL PERFORMANS / ПРОИЗВОДИТЕЛЬНОСТЬ PEARL / PEARL 性能](#performans)
- [HIVEOS](#hiveos)
- [DOWNLOAD / ЗАГРУЗКА / 下载](#download)
- [MINER SETTINGS / НАСТРОЙКИ МАЙНЕРА / 矿工设置](#miner-settings)

---

<a id="performans"></a>

## PEARL PERFORMANS / ПРОИЗВОДИТЕЛЬНОСТЬ PEARL / PEARL 性能

| GPU | Hashrate, TH/s | Power, W | Core Offset | Fix Core | Fix Mem | Mem Offset | Efficiency, TH/W |
|---|---:|---:|---:|---:|---:|---:|---:|
| CMP 40HX | **47.1** | **132** | 255 | 1650 | 5000 | — | **0.357** |
| RTX 2080 | **63.7** | **171** | 135 | 1650 | 5000 | — | **0.372** |
| CMP 50HX | **76.35** | **210** | 255 | 1650 | 5000 | — | **0.364** |
| CMP 70HX | **46.75** | **150** | 255 | 1650 | — | -2000 | **0.312** |
| RTX 3060 Ti | **61.4** | **143** | 255 | 1650 | 5000 | — | **0.429** |
| RTX 3070m | **65.3** | **130** | 255 | 1650 | 6000 | — | **0.502** |
| RTX 3070 | **75.0** | **160** | 255 | 1650 | 5000 | — | **0.469** |
| CMP 90HX | **70.35** | **210** | 300 | 1650 | — | -2000 | **0.335** |
| RTX 3080 Ti | **128** | **300** | 255 | 1650 | 5000 | — | **0.427** |
| CMP 170HX | **175** | **240** | 300 | 1455 | — | 0 | **0.729** |
| RTX 4070 Ti | **143.5** | **175** | 345 | 2445 | 5000 | — | **0.820** |
| RTX 4090 | **293** | **380** | 315 | 2445 | 5000 | — | **0.771** |
| RTX 5070 Ti | **164.5** | **208** | 480 | 2445 | 7000 | — | **0.791** |

---

<a id="hiveos"></a>

## HIVEOS <sub><a href="#contents">↑ Contents / Оглавление / 目录</a></sub>
<p align="center">
  <img
    src="https://github.com/user-attachments/assets/f3a6ea67-e42e-4f02-af65-4797d4afe268"
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
        "url": " YOUR_POOL",
        "algo": "pearlhash",
        "miner": "rgminer",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v1.0.3/rgminer-1.0.3-hiveos.tar.gz"
      },
      "pool_geo": []
    }
  ]
}
```

---

<a id="download"></a>

## DOWNLOAD / ЗАГРУЗКА / 下载 <sub><a href="#contents">↑ Contents / Оглавление / 目录</a></sub>

| Platform | Release file |
|---|---|
| Linux standalone | [`rgminer-1.0.3`](https://github.com/Printscan/rgminer/releases/download/v1.0.3/rgminer-1.0.3) |
| Windows | [`rgminer-1.0.3-windows.zip`](https://github.com/Printscan/rgminer/releases/download/v1.0.3/rgminer-1.0.3-windows.zip) |
| HiveOS | [`rgminer-1.0.3-hiveos.tar.gz`](https://github.com/Printscan/rgminer/releases/download/v1.0.3/rgminer-1.0.3-hiveos.tar.gz) |
| MMPOS | [`rgminer-1.0.3-mmpos.tar.gz`](https://github.com/Printscan/rgminer/releases/download/v1.0.3/rgminer-1.0.3-mmpos.tar.gz) |
| Docker | [`palmatorro/rgminer:1.0.3`](https://hub.docker.com/r/palmatorro/rgminer) |

---

<a id="miner-settings"></a>

## MINER SETTINGS / НАСТРОЙКИ МАЙНЕРА / 矿工设置 <sub><a href="#contents">↑ Contents / Оглавление / 目录</a></sub>

<a id="english"></a>

<details>
<summary><strong>English</strong></summary>

<a id="english-contents"></a>

## Contents

- [Quick Start](#quick-start)
- [Algorithms](#algorithms)
- [CLI Options](#cli-options)
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
chmod +x rgminer-1.0.3

./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name WORKER
```

Several pools can be specified in priority order:

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST1:PORT1,HOST2:PORT2 \
  --wallet WALLET
```

Use `stratum+tls://` or `--stratum-tls` to enable verified TLS:

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum stratum+tls://HOST:PORT \
  --wallet WALLET
```

Docker installation and launch:

```bash
docker pull palmatorro/rgminer:1.0.3

docker run -d \
  --gpus all \
  --restart unless-stopped \
  --name rgminer \
  palmatorro/rgminer:1.0.3 \
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
| `exfer`, `exfer-argon2id` | EXFER Argon2id Stratum mining | 5% |

Pearl example:

```bash
./rgminer-1.0.3 --algo pearl --stratum HOST:PORT --wallet WALLET
```

EXFER example:

```bash
./rgminer-1.0.3 --algo exfer-argon2id --stratum HOST:PORT --wallet WALLET
```

---

<a id="cli-options"></a>

## CLI Options <sub><a href="#english-contents">↑ Back to contents</a></sub>

The table below follows the actual `rgminer-1.0.3 --help` output.

### Pool connection

| Option | Description |
|---|---|
| `--algo ALGO` | Select `pearl`, `exfer-argon2id` or the `exfer` alias. |
| `--stratum HOST:PORT[,HOST:PORT]` | Pool endpoint or a priority-ordered pool list. `stratum+tls://` is supported. |
| `--wallet WALLET`, `--address WALLET` | Payout wallet or pool user. |
| `--worker NAME`, `--worker-name NAME` | Worker or rig name. |
| `--stratum-pass PASS` | Pool password. |
| `--stratum-tls` | Force verified TLS for Stratum. |
| `--proto NAME` | Select a non-default Pearl pool protocol: `alphapool`, `herominers`, `kryptex`, `f2pool` or `pearlfortune`. Omit the option for automatic AkoyaV2. |

### GPU, API and safety

| Option | Description |
|---|---|
| `-d GPU[,GPU]`, `--devices GPU[,GPU]` | Select CUDA device indices. |
| `--api-host HOST` | API listener address. Use with `--api-port`. |
| `--api-port PORT` | API listener port. Use with `--api-host`. |
| `--plain-console` | Disable the live console UI and print plain log output. |
| `--watchdog=off`, `--watchdog=restart`, `--watchdog=reboot` | Select no recovery, miner restart or rig reboot after a CUDA failure. |

API example:

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --api-host 127.0.0.1 \
  --api-port 9200
```

---

<a id="miner-api"></a>

## Miner API <sub><a href="#english-contents">↑ Back to contents</a></sub>

The protected release exposes a read-only JSON API on `127.0.0.1:9200` by default. The launcher aggregates statistics from all selected GPUs and CUDA backend processes.

Change the listener address or port when starting the miner:

```bash
./rgminer-1.0.3 \
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

Clock options use physical NVIDIA GPU indices and are applied through NVML.

| Option | Description |
|---|---|
| `--cclock GPU:OFFSET[,GPU:OFFSET]` | Graphics clock offset in MHz. |
| `--mclock GPU:OFFSET[,GPU:OFFSET]` | Memory transfer-rate offset in MHz. |
| `--lock-cclock GPU:MHz[,GPU:MHz]` | Lock the graphics clock to an absolute value. |
| `--lock-mclock GPU:MHz[,GPU:MHz]` | Lock the memory clock to an absolute value. |

Multi-GPU example:

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --cclock 0:125,1:250 \
  --mclock 0:500,1:1000 \
  --lock-cclock 0:1650,1:2450 \
  --lock-mclock 0:7000,1:7000
```

Clock changes require sufficient NVIDIA driver permissions. Start with conservative values and validate each GPU separately.

---

<a id="cmp-options"></a>

## CMP Options <sub><a href="#english-contents">↑ Back to contents</a></sub>

| Option | Description |
|---|---|
| `--no-cmp-unlock` | Disable every automatic CMP unlock path. |
| `--cmp-blob-source SOURCE` | Use an HTTPS base URL or an exact CMP blob file. |

---

<a id="troubleshooting"></a>

## Troubleshooting <sub><a href="#english-contents">↑ Back to contents</a></sub>

### Show release help

```bash
./rgminer-1.0.3 --help
```

### Permission denied

```bash
chmod +x rgminer-1.0.3
```

### A GPU must not be used

Select only the required CUDA indices:

```bash
./rgminer-1.0.3 --devices 0,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### CMP handling must be disabled

```bash
./rgminer-1.0.3 --no-cmp-unlock -d 0,1,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### Plain logs are required

Add `--plain-console` to disable the live terminal interface.

---

<a id="resources"></a>

## Resources <sub><a href="#english-contents">↑ Back to contents</a></sub>

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
chmod +x rgminer-1.0.3

./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name WORKER
```

Несколько резервных пулов указываются в порядке приоритета через запятую:

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST1:PORT1,HOST2:PORT2 \
  --wallet WALLET
```

Для проверяемого TLS используйте `stratum+tls://` или `--stratum-tls`:

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum stratum+tls://HOST:PORT \
  --wallet WALLET
```

Установка и запуск через Docker:

```bash
docker pull palmatorro/rgminer:1.0.3

docker run -d \
  --gpus all \
  --restart unless-stopped \
  --name rgminer \
  palmatorro/rgminer:1.0.3 \
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
| `exfer`, `exfer-argon2id` | Майнинг EXFER Argon2id через Stratum | 5% |

Пример Pearl:

```bash
./rgminer-1.0.3 --algo pearl --stratum HOST:PORT --wallet WALLET
```

Пример EXFER:

```bash
./rgminer-1.0.3 --algo exfer-argon2id --stratum HOST:PORT --wallet WALLET
```

---

<a id="ru-cli-options"></a>

## Параметры запуска <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

Таблица составлена по фактическому выводу `rgminer-1.0.3 --help`.

### Подключение к пулу

| Параметр | Описание |
|---|---|
| `--algo ALGO` | Выбор `pearl`, `exfer-argon2id` или псевдонима `exfer`. |
| `--stratum HOST:PORT[,HOST:PORT]` | Адрес пула или список пулов по приоритету. Поддерживается `stratum+tls://`. |
| `--wallet WALLET`, `--address WALLET` | Кошелёк для выплат или имя пользователя пула. |
| `--worker NAME`, `--worker-name NAME` | Имя воркера или рига. |
| `--stratum-pass PASS` | Пароль пула. |
| `--stratum-tls` | Принудительно использовать TLS с проверкой сертификата. |
| `--proto NAME` | Выбрать нестандартный протокол пула Pearl: `alphapool`, `herominers`, `kryptex`, `f2pool` или `pearlfortune`. Для автоматического AkoyaV2 параметр не указывается. |

### GPU, API и безопасность

| Параметр | Описание |
|---|---|
| `-d GPU[,GPU]`, `--devices GPU[,GPU]` | Выбор индексов CUDA-устройств. |
| `--api-host HOST` | Адрес API. Используется вместе с `--api-port`. |
| `--api-port PORT` | Порт API. Используется вместе с `--api-host`. |
| `--plain-console` | Отключить интерактивный интерфейс и выводить обычный лог. |
| `--watchdog=off`, `--watchdog=restart`, `--watchdog=reboot` | Не восстанавливаться, перезапустить майнер или перезагрузить риг после ошибки CUDA. |

Пример включения API:

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --api-host 127.0.0.1 \
  --api-port 9200
```

---

<a id="ru-miner-api"></a>

## API майнера <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

Защищённый релиз по умолчанию предоставляет API статистики в формате JSON на `127.0.0.1:9200`. Launcher объединяет статистику всех выбранных GPU и CUDA backend-процессов.

Адрес и порт можно изменить при запуске:

```bash
./rgminer-1.0.3 \
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

Параметры частот используют физические индексы NVIDIA GPU и применяются через NVML.

| Параметр | Описание |
|---|---|
| `--cclock GPU:OFFSET[,GPU:OFFSET]` | Смещение частоты ядра в МГц. |
| `--mclock GPU:OFFSET[,GPU:OFFSET]` | Смещение эффективной частоты памяти в МГц. |
| `--lock-cclock GPU:MHz[,GPU:MHz]` | Фиксация абсолютной частоты ядра. |
| `--lock-mclock GPU:MHz[,GPU:MHz]` | Фиксация абсолютной частоты памяти. |

Пример для нескольких GPU:

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --cclock 0:125,1:250 \
  --mclock 0:500,1:1000 \
  --lock-cclock 0:1650,1:2450 \
  --lock-mclock 0:7000,1:7000
```

Для изменения частот нужны соответствующие разрешения драйвера NVIDIA. Начинайте с безопасных значений и проверяйте каждую карту отдельно.

---

<a id="ru-cmp-options"></a>

## Параметры CMP <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

| Параметр | Описание |
|---|---|
| `--no-cmp-unlock` | Полностью отключить автоматические CMP unlock-пути. |
| `--cmp-blob-source SOURCE` | Указать базовый HTTPS URL или точный файл CMP blob. |

---

<a id="ru-troubleshooting"></a>

## Решение проблем <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

### Показать справку релиза

```bash
./rgminer-1.0.3 --help
```

### Ошибка Permission denied

```bash
chmod +x rgminer-1.0.3
```

### Нужно исключить GPU

Укажите только необходимые CUDA-индексы:

```bash
./rgminer-1.0.3 --devices 0,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### Нужно отключить обработку CMP

```bash
./rgminer-1.0.3 --no-cmp-unlock -d 0,1,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### Нужен обычный текстовый лог

Добавьте `--plain-console`, чтобы отключить интерактивный терминальный интерфейс.

---

<a id="ru-resources"></a>

## Ресурсы <sub><a href="#russian-contents">↑ К оглавлению</a></sub>

- [Релизы](https://github.com/Printscan/rgminer/releases)
- [Сообщить о проблеме](https://github.com/Printscan/rgminer/issues)
- [Репозиторий](https://github.com/Printscan/rgminer)

При сообщении об ошибке укажите имя релизного файла, модель GPU, версию драйвера NVIDIA, операционную систему, полную команду без кошелька и относящийся к проблеме фрагмент лога.

</details>

<a id="chinese"></a>

<details>
<summary><strong>中文</strong></summary>

<a id="chinese-contents"></a>

## 目录

- [快速开始](#zh-quick-start)
- [算法](#zh-algorithms)
- [命令行参数](#zh-cli-options)
- [矿工 API](#zh-miner-api)
- [超频设置](#zh-overclock)
- [CMP 参数](#zh-cmp-options)
- [故障排除](#zh-troubleshooting)
- [资源](#zh-resources)

---

<a id="zh-quick-start"></a>

## 快速开始 <sub><a href="#chinese-contents">↑ 返回目录</a></sub>

赋予 Linux 独立版可执行权限，然后指定算法、矿池和钱包启动：

```bash
chmod +x rgminer-1.0.3

./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name WORKER
```

可按优先顺序使用逗号指定多个备用矿池：

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST1:PORT1,HOST2:PORT2 \
  --wallet WALLET
```

使用 `stratum+tls://` 或 `--stratum-tls` 启用经过证书验证的 TLS：

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum stratum+tls://HOST:PORT \
  --wallet WALLET
```

通过 Docker 安装并运行：

```bash
docker pull palmatorro/rgminer:1.0.3

docker run -d \
  --gpus all \
  --restart unless-stopped \
  --name rgminer \
  palmatorro/rgminer:1.0.3 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --worker-name docker-rig
```

主机必须安装可用的 NVIDIA 驱动、Docker 和 `nvidia-container-toolkit`。

---

<a id="zh-algorithms"></a>

## 算法 <sub><a href="#chinese-contents">↑ 返回目录</a></sub>

| `--algo` 参数值 | 用途 | 开发者费用 |
|---|---|---|
| `pearl` | Pearl GPU 挖矿 | 2% |
| `exfer`、`exfer-argon2id` | EXFER Argon2id Stratum 挖矿 | 5% |

Pearl 示例：

```bash
./rgminer-1.0.3 --algo pearl --stratum HOST:PORT --wallet WALLET
```

EXFER 示例：

```bash
./rgminer-1.0.3 --algo exfer-argon2id --stratum HOST:PORT --wallet WALLET
```

---

<a id="zh-cli-options"></a>

## 命令行参数 <sub><a href="#chinese-contents">↑ 返回目录</a></sub>

下表来自实际的 `rgminer-1.0.3 --help` 输出。

### 矿池连接

| 参数 | 说明 |
|---|---|
| `--algo ALGO` | 选择 `pearl`、`exfer-argon2id` 或别名 `exfer`。 |
| `--stratum HOST:PORT[,HOST:PORT]` | 单个矿池地址或按优先级排列的矿池列表。支持 `stratum+tls://`。 |
| `--wallet WALLET`、`--address WALLET` | 收款钱包或矿池用户名。 |
| `--worker NAME`、`--worker-name NAME` | 工人或矿机名称。 |
| `--stratum-pass PASS` | 矿池密码。 |
| `--stratum-tls` | 强制使用并验证 TLS 证书。 |
| `--proto NAME` | 选择非默认 Pearl 矿池协议：`alphapool`、`herominers`、`kryptex`、`f2pool` 或 `pearlfortune`。省略该参数时自动使用 AkoyaV2。 |

### GPU、API 与安全

| 参数 | 说明 |
|---|---|
| `-d GPU[,GPU]`、`--devices GPU[,GPU]` | 选择 CUDA 设备索引。 |
| `--api-host HOST` | API 监听地址，与 `--api-port` 一起使用。 |
| `--api-port PORT` | API 监听端口，与 `--api-host` 一起使用。 |
| `--plain-console` | 禁用实时控制台界面并输出普通日志。 |
| `--watchdog=off`、`--watchdog=restart`、`--watchdog=reboot` | CUDA 错误后选择不恢复、重启矿工或重启矿机。 |

API 示例：

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --api-host 127.0.0.1 \
  --api-port 9200
```

---

<a id="zh-miner-api"></a>

## 矿工 API <sub><a href="#chinese-contents">↑ 返回目录</a></sub>

受保护的发行版默认在 `127.0.0.1:9200` 提供只读 JSON API。启动器会汇总所有已选择 GPU 和 CUDA 后端进程的统计信息。

启动矿工时可以修改监听地址或端口：

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --api-host 127.0.0.1 \
  --api-port 9200
```

### 接口

| 请求 | 响应 |
|---|---|
| `GET /health` | API 状态和当前已发布的 GPU 记录数量。 |
| `GET /metrics` | 每张 GPU 的详细 JSON 统计信息。 |

```bash
curl -s http://127.0.0.1:9200/health
curl -s http://127.0.0.1:9200/metrics
```

`/health` 返回：

```json
{"status":"ok","running":1}
```

在受保护的发行版中，`running` 表示启动器当前聚合指标快照中的 GPU 记录数量。它说明 API 数据可用，但不能单独证明矿池已连接、算力大于零或已有已接受份额。

`/metrics` 返回一个 `miners` 数组。每个 GPU 对象包含：

| 字段 | 含义 |
|---|---|
| `deviceId`, `deviceIdScope`, `gpuName`, `pciBusId`, `pid` | 物理 GPU 和后端进程标识。 |
| `lastJobId`, `lastHeight`, `algo` | 当前挖矿任务和算法。 |
| `emaRate` | 原始 `H/s` 单位的平滑算力。除以 `1e12` 可换算为 `TH/s`。 |
| `lastChecked`, `lastStatus`, `lastError` | 当前工作计数器、状态和最近错误。 |
| `acceptedShares`, `rejectedShares`, `staleShares`, `foundBlocks` | 份额与区块计数器。 |
| `lastDifficulty` | 最近发布的难度。 |
| `totalChecked`, `totalElapsedMs` | 累计工作量和计算耗时。 |
| `lastUpdated`, `processUptimeMs` | Unix 更新时间和进程运行时间，单位均为毫秒。 |

显示常用字段：

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

计算总算力（单位 `H/s`）：

```bash
curl -s http://127.0.0.1:9200/metrics |
  jq '[.miners[].emaRate] | add // 0'
```

API 只支持 `GET`。未知路径返回 `404`，其他方法返回 `405`；一秒内超过 100 个请求时可能返回 `429` 和 `Retry-After: 1`。

> [!WARNING]
> API 不提供身份验证或 TLS。建议保留默认的 `127.0.0.1` 绑定。只有在防火墙、带身份验证的反向代理或 VPN 后方才应将 API 暴露到网络。

---

<a id="zh-overclock"></a>

## 超频设置 <sub><a href="#chinese-contents">↑ 返回目录</a></sub>

频率参数使用 NVIDIA GPU 的物理索引，并通过 NVML 应用。

| 参数 | 说明 |
|---|---|
| `--cclock GPU:OFFSET[,GPU:OFFSET]` | 核心频率偏移，单位 MHz。 |
| `--mclock GPU:OFFSET[,GPU:OFFSET]` | 显存传输频率偏移，单位 MHz。 |
| `--lock-cclock GPU:MHz[,GPU:MHz]` | 将核心频率锁定到绝对值。 |
| `--lock-mclock GPU:MHz[,GPU:MHz]` | 将显存频率锁定到绝对值。 |

多 GPU 示例：

```bash
./rgminer-1.0.3 \
  --algo pearl \
  --stratum HOST:PORT \
  --wallet WALLET \
  --cclock 0:125,1:250 \
  --mclock 0:500,1:1000 \
  --lock-cclock 0:1650,1:2450 \
  --lock-mclock 0:7000,1:7000
```

修改频率需要足够的 NVIDIA 驱动权限。请从保守参数开始，并逐张验证 GPU。

---

<a id="zh-cmp-options"></a>

## CMP 参数 <sub><a href="#chinese-contents">↑ 返回目录</a></sub>

| 参数 | 说明 |
|---|---|
| `--no-cmp-unlock` | 禁用所有自动 CMP 解锁流程。 |
| `--cmp-blob-source SOURCE` | 指定 HTTPS 基础地址或确切的 CMP blob 文件。 |

---

<a id="zh-troubleshooting"></a>

## 故障排除 <sub><a href="#chinese-contents">↑ 返回目录</a></sub>

### 显示发行版帮助

```bash
./rgminer-1.0.3 --help
```

### Permission denied 错误

```bash
chmod +x rgminer-1.0.3
```

### 不使用某张 GPU

仅选择需要的 CUDA 设备索引：

```bash
./rgminer-1.0.3 --devices 0,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### 禁用 CMP 处理

```bash
./rgminer-1.0.3 --no-cmp-unlock -d 0,1,2 --algo pearl --stratum HOST:PORT --wallet WALLET
```

### 需要普通文本日志

添加 `--plain-console` 以禁用实时终端界面。

---

<a id="zh-resources"></a>

## 资源 <sub><a href="#chinese-contents">↑ 返回目录</a></sub>

- [发行版](https://github.com/Printscan/rgminer/releases)
- [问题反馈](https://github.com/Printscan/rgminer/issues)
- [代码仓库](https://github.com/Printscan/rgminer)

反馈问题时，请提供发行文件名、GPU 型号、NVIDIA 驱动版本、操作系统、移除钱包后的完整命令以及相关日志片段。

</details>
