# Custom miner integration in Hive OS

<details>
<summary>Hive OS FS JSON (vecno)</summary>

```json
[{
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
        "url": "147.45.108.5:59007",
        "algo": "memehash",
        "miner": "rgminer",
        "template": "%WAL%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v0.6.5/rgminer-0.6.5.tar.gz"
      },
      "pool_geo": []
    }
  ]
}]
```
</details>

<p align="center">
  <img width="1762" height="247" alt="image" src="https://github.com/user-attachments/assets/8bfe8164-e975-4277-9058-999fcc1d3d46" />
</p>
<p align="center">
<img width="1811" height="84" alt="image" src="https://github.com/user-attachments/assets/7a719946-12fb-4a0e-8e2c-09c8752134d3" />
</p>

## Tested
- GPU: GeForce RTX 3070 Laptop
- Driver: 550.144.03 (NVIDIA)

- 3070m: 35.6+ Mh 
- 2080: 33+ Mh
- 4070ti: 70+ Mh
- 4090: 190+ Mh


