# Third-Party Notices & Attribution Ledger — HKM Team

This project, **FightPort 4 V2**, is maintained and released by **HKM Team** (https://github.com/HKM-Team).
It combines proprietary novel code developed from scratch by HKM Team with specialized open-source modules and upstream projects.

---

## 1. Proprietary HKM Team Core (100% Authorial)
- **Components:** `FightPort4.exe`, UI & GDI+ frontend engine, multi-tab layout, single-button PKG extraction suite, dynamic settings synchronizer, and athlete icon gallery.
- **Copyright:** © 2026 HKM Team.
- **Licensing:** Tri-Licensed under the terms of MIT License, Apache License 2.0, and GNU General Public License v3.0.
- **Trademark & Brand Shield:**
  - The name **"HKM Team"**, its brand, and associated visual logos are the exclusive identity of HKM Team (https://github.com/HKM-Team).
  - Any third-party fork or redistribution **MUST retain full attribution** to the original authors and HKM Team.
  - **RESTRICTION:** Third parties are **STRICTLY PROHIBITED** from using the designation "HKM Team" in their project titles, binaries, or release channels, preventing deceptive builds, scam distributions, or malicious tampering from being associated with HKM Team.

---

## 2. Game Port & Execution Runtime
- **Origin:** SacredFire runtime, bbport (`deadinside28/bloodborne_pc`, `Supermedo/bloodborne_pc`), and shadPS4 core components (`shadps4-emu/shadPS4`).
- **License:** GNU General Public License v2.0 or later (GPL-2.0-or-later).
- **Modifications by HKM Team:**
  - Automated 7.1 to 2.0 clean stereo audio downmixing with soft limiter and 50%-300% gain control.
  - Custom memory allocator optimizations preventing career mode crashes during cutscenes.
  - Vulkan presentation barrier tuning for simultaneous Mailbox and FIFO modes.
  - Intel CPU/GPU instruction set compatibility patches.

---

## 3. Graphics Reconstructions & Upscaling Module
- **Origin:** OptiScaler (`github.com/cdozdil/OptiScaler`), authored by **nitec** (nitec97 / cdozdil) and contributors.
- **License:** MIT License.
- **Modifications by HKM Team:**
  - Direct wrapper injection via `bin/winmm.dll`.
  - Bidirectional real-time settings synchronizer (FightPort UI <-> In-Game OptiScaler Overlay).
  - Continuous background updater script and headless profile injector.
- **Included Vendor SDKs:**
  - AMD FidelityFX SDK (MIT License - Copyright © AMD)
  - Intel XeSS SDK (Intel XeSS License - Copyright © Intel Corporation)
  - NVIDIA DLSS / Streamline SDK (NVIDIA Proprietary SDK License - Copyright © NVIDIA Corporation)

---

## 4. Extraction & Tooling Utilities
- **Origin:** OrbisPkgTool / PS4PKGTool Core (`github.com`).
- **License:** MIT License / Open Source licenses as retained in `tools/pkg_tool/`.

---

## Legal Disclaimer
FightPort 4 and HKM Team are independent open-source efforts not affiliated with, endorsed by, or connected to Electronic Arts Inc., Sony Interactive Entertainment Inc., or the Ultimate Fighting Championship (UFC). No game ROMs, assets, or copyrighted game files are redistributed in this package.
