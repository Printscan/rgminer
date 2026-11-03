# CMP v5 RM blobs

Encrypted exact-driver RM blobs for rgminer: CMP30HX, CMP40HX, CMP50HX, CMP70HX and CMP90HX memory-floor policy plus RM NoCMP; CMP170HX keeps its existing policy. SHA256SUMS identifies every encrypted container.

CMP70HX and CMP90HX paired 405/810 MHz clock entries are derived from each card's own BIT C / DRAM / program / working tables. CMP90HX no longer requires an exact BIOS version or whole-ROM byte identity. Structural, pointer, range, ownership and checksum validation remain enabled. The memory patch has not been disabled; idle/high clocks, timing tables, voltage equations and unused CMP90 rail records are preserved.

Validation: all 14 supported driver containers passed native miner decryption, exact plaintext comparison and NoCMP idempotence checks. The corrected 595.91.07 blob was physically tested on four CMP90HX cards: initialization and actual 810 MHz memory succeeded with BIOS 94.02.74.00.07; all eight GPUs in the mixed rig enumerated through NVML. Full CUDA/Pearl mining validation remains unverified. This is not hardware validation of every driver release or GPU model.

Use a miner containing the matching updated v5 descriptor catalog (release sequence 2026110313 or newer catalog). Older miners with pinned previous plaintext hashes reject these replaced artifacts; updating only the remote blob cannot update an old binary's embedded catalog.
