# Custom miner integration in Hive OS

<details>
<summary>Hive OS FS JSON (vecno)</summary>

```json
{
  "name": "vecno",
  "isFavorite": false,
  "items": [
    {
      "coin": "vecno",
      "pool_ssl": false,
      "wal_id": 10990108,
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "rgminer",
      "miner_config": {
        "url": "http://147.45.108.5:59006/",
        "algo": "memehash",
        "miner": "rgminer",
        "template": "%WAL%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/rgminer/rgminer-0.4.0.tar.gz"
      },
      "pool_geo": []
    }
  ]
}
```
</details>

<p align="center">
  <img width="1280" height="202" alt="Hive OS FS JSON example" src="https://github.com/user-attachments/assets/dc3fbe94-2850-4fd0-b09c-cdb5e84fc3ef" />
</p>
<p align="center">
  <img width="1383" height="161" alt="rgminer running in Hive OS" src="https://github.com/user-attachments/assets/1abbf242-7388-49c6-b89d-ceeef769f3e3" />
</p>

## Tested
- GPU: GeForce RTX 3070 Laptop
- Driver: 550.144.03 (NVIDIA)
