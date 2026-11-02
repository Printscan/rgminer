# cmp 30-90 810 mem mhz unlock

v5 RM blobs for rgminer, supporting CMP 30HX, 40HX, 50HX, 70HX and 90HX with an 810 MHz memory floor and the RM NoCMP patch.

Each driver directory contains `nv-kernel.o_binary.enc` in the format consumed by the miner. Use the file matching the exact NVIDIA driver version. `SHA256SUMS` lists the encrypted file hashes.

CMP 70HX is selected by PCI Device ID `0x248A` only. Its paired 405/810 MHz clock entries are derived from the card's own ROM; there is no board, BIOS version or whole-ROM hash pin. Unsupported ROM layouts retain stock settings.

CMP 170HX also requires v5 for RM NoCMP during miner installation and updates, even with automatic patch updates disabled. Its HBM policy is unchanged.

The 595.91.07 CMP 70HX blob was tested on two cards at 810 MHz with a 60-second CUDA memory-pattern check per card and no errors. All 14 driver artifacts passed the miner's native decryption and byte-for-byte verification; this is not a hardware test of all driver versions.
