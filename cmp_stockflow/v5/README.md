# cmp 30-90 810 mem mhz unlock

Encrypted v5 RM blobs for rgminer, supporting CMP 30HX, 40HX, 50HX, 70HX and 90HX with an 810 MHz memory floor and the RM NoCMP patch.

Each driver directory contains `nv-kernel.o_binary.enc` in the format consumed by the miner. Use the file matching the exact NVIDIA driver version. `SHA256SUMS` lists the encrypted file hashes.

Hardware validation: two CMP 50HX and five CMP 90HX passed CUDA memory checks at 810 MHz on 580.159.03, 590.48.01, 595.84 and 610.43.03, without a miner running and with no Xid errors. The identical final 615.71.09 blob passed an earlier test with a miner running. CMP 30HX, 40HX and 70HX have source and synthetic coverage only; these cards were not available for hardware validation. Other packaged driver versions were build and integrity checked.

CMP 170HX retains its existing v4 support; this 810 MHz memory change targets CMP 30HX through 90HX.
