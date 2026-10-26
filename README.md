# FightPort 4 V2 (2.12.7.0) — EA SPORTS UFC 4 Native PC Port Launcher

[![Discord](https://img.shields.io/badge/Discord-Comunidade%20Oficial-5865F2?logo=discord&logoColor=white)](https://discord.gg/sRCaE57yn)
[![Version](https://img.shields.io/badge/Version-V2%20(2.12.7.0)-gold.svg)](#)
[![Team](https://img.shields.io/badge/Maintained%20by-HKM%20Team-blue.svg)](https://github.com/HKM-Team)
[![License](https://img.shields.io/badge/License-GPL--2.0--or--later-green.svg)](licenses/LICENSE-GPL-2.0.txt)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%2F11%20(64--bit)%20%7C%20Linux%20(Proton)-lightgrey.svg)](#)

> [!IMPORTANT]
> ### 💬 Comunidade Oficial no Discord & Suporte aos Jogos
> **Quer trocar uma ideia, saber mais sobre o projeto ou precisa de ajuda técnica com os executáveis?**  
> Junte-se ao servidor oficial da **HKM Team** no Discord: **[https://discord.gg/sRCaE57yn](https://discord.gg/sRCaE57yn)**
> 
> ⚠️ **AVISO OBRIGATÓRIO — ARQUIVOS DO JOGO NÃO INCLUSOS:**  
> **Ao baixar este inicializador (launcher), o jogo NÃO vem junto!** A pessoa precisa ter a sua própria cópia legítima do **EA SPORTS UFC 4** (Jogo Base v1.00 e Atualização Oficial 28.00 em formato `.pkg`). Este projeto é estritamente um inicializador de código aberto e não distribui arquivos protegidos por direitos autorais.  
> **Dúvidas sobre como extrair ou configurar?** Entre no nosso Discord, nossa comunidade e suporte estão prontos para ajudar!

> [!NOTE]
> ### 💬 Official Discord Community & Support (English)
> **Want to discuss the project, learn more, or need setup assistance?**  
> Join our official Discord server: **[https://discord.gg/sRCaE57yn](https://discord.gg/sRCaE57yn)**  
> ⚠️ **IMPORTANT NOTICE:** Downloading this launcher **DOES NOT include any copyrighted game files**. You must provide your own legally owned copy of EA SPORTS UFC 4 (Base Game v1.00 & Update v28.00 PKG). For questions regarding extraction or setup, visit our Discord!

---

Dedicated launcher, graphics configuration hub, and single-click PKG extraction system for the native PC port of **EA SPORTS UFC 4** (PlayStation 4, `CUSA14209` & `CUSA14204`, official update **28.00**).

---

## 🥊 English (EN)

### Overview
FightPort 4 V2 delivers an ultra-smooth, responsive PC experience for EA SPORTS UFC 4, running over a high-performance native **Vulkan** translation pipeline.
Featuring integrated **OptiScaler v0.1.34-with-dlss-fg** (developed by **nitec** & community), it provides next-gen image upscaling (FSR, XeSS, DLSS), Frame Generation (from 120 FPS up to 6X MFG), neural rendering (DLSS 5), active latency mitigation, high-clarity 2.0 stereo audio, full controller support, and integrated one-click PKG extraction.

### Key Features
- **Bidirectional In-Game & Launcher Sync:** Adjust graphics inside the launcher before playing or hit `Insert` during combat to tweak OptiScaler overlay settings in real time.
- **Next-Gen Upscaling & Frame Gen:** Support for AMD FSR (1.0 to 4.1.1), Intel XeSS (1.3 & 2.0), NVIDIA DLSS (3.5 & 4.5), and Frame Generation up to 240+ Hz.
- **One-Click PKG Installer:** Automated extraction and patch-merging from the `EXTRAÇÃO DE PKG` tab.
- **Audio Overhaul:** Clean downmixing of 7.1 surround sound into crisp 2-channel stereo with volume amplification up to 300%.
- **Portable Distribution:** Runs directly from an unzipped folder without intrusive installers or registry changes.

### Visual Showcase (Screenshots)
Place screenshots in `assets/screenshots/`:
- `assets/screenshots/launcher_main.png` — *FightPort 4 Settings & Upscale Dashboard*
- `assets/screenshots/pkg_extractor.png` — *Single-Click Base Game + Update PKG Extractor*
- `assets/screenshots/gameplay_action.png` — *High-FPS Octagon Gameplay with OptiScaler Overlay*

### How to Install & Run
You can choose between two installation formats:

#### Option A: Portable Archive (.zip)
1. Download `FightPort4_V2_12.7.0.zip` from [Releases](https://github.com/HKM-Team).
2. Extract the archive into your preferred directory (e.g., `D:\Games\FightPort4`).
3. Launch `FightPort4.exe`.

#### Option B: Executable Installer (.exe)
1. Download `FightPort4_V2_12.7.0_Setup.exe` from [Releases](https://github.com/HKM-Team).
2. Run the setup wizard, choose your installation path, and let it create the Desktop and Start Menu shortcuts automatically.
3. Launch FightPort 4 from your desktop!

#### Extracting Game Files (First Run)
1. In the `EXTRAÇÃO DE PKG` tab, click **`PROCURAR...`**.
2. Select your Base Game PKG (`v1.00`, `CUSA14209` or `CUSA14204`) and the official Update PKG (`v28.00`) together.
3. Click **`Extrair para o Jogo`**. FightPort 4 unpacks and merges the update cleanly into `games\UFC4`.
4. Head to `CONFIGURAÇÕES` or `UPSCALE & FG`, click **`JOGAR`**, and step into the Octagon!

### Feature & Attribution Matrix
| Module | Author / Origin | License | Status |
|---|---|---|---|
| **FightPort 4 UI & Core** | **HKM Team** (https://github.com/HKM-Team) | Tri-License (MIT/Apache 2.0/GPLv3) | Stable v2.12.7.0 |
| **PKG Extraction Engine** | **HKM Team** & OrbisPkgTool contributors | MIT / Open Source | Verified |
| **UFC 4 Native Port Engine** | SacredFire / bbport / shadPS4 core | GNU GPL-2.0-or-later | Tested v0.2.6 |
| **Upscaling & Frame Gen** | OptiScaler (nitec & community) | MIT License | Injected v0.1.34 |

---

## 🥊 Português (PT-BR)

### Visão Geral
O **FightPort 4 V2 (2.12.7.0)** entrega a experiência definitiva para jogar EA SPORTS UFC 4 no computador, executando sobre uma camada nativa de alta velocidade em **Vulkan**.
Equipado com o **OptiScaler v0.1.34-with-dlss-fg** (desenvolvido por **nitec** e comunidade), traz as tecnologias mais modernas de reconstrução de imagem (FSR, XeSS e DLSS), Geração de Quadros (Frame Generation de 120 FPS até 6X), renderização neural (DLSS 5), controle de latência ultra-baixa, áudio estéreo com volume amplificado, suporte completo a controles e extrator nativo de PKG em botão único.

### Principais Inovações
- **Sincronização Bidirecional em Tempo Real:** Configure os gráficos pelo inicializador antes de jogar ou pressione **`Insert`** durante a luta para alterar parâmetros no menu de sobreposição do OptiScaler em tempo real.
- **Extrator Nativo de PKG:** Selecione o jogo base (v1.00) e a atualização oficial (v28.00) com um único clique no botão `PROCURAR...` para descompactar e mesclar os arquivos automaticamente.
- **Galeria de Ícones de Atletas:** 19 ícones exclusivos em alta resolução homenageando lendas do MMA (Poatan, Charles, Jones, Anderson, Khabib e outros) com aplicação imediata no Desktop.
- **Som Nítido Estéreo 2.0:** Conversão direta do áudio 7.1 original para estéreo equilibrado, garantindo narrações altas e impactos claros.

### Como Instalar e Jogar
Você pode escolher entre duas formas de distribuição:

#### Opção A: Pacote Portátil (.zip)
1. Baixe o pacote `FightPort4_V2_12.7.0.zip` nas [Releases oficiais da HKM Team](https://github.com/HKM-Team).
2. Descompacte o arquivo `.zip` na pasta de sua preferência (ex: `C:\Jogos\FightPort4`).
3. Execute o inicializador **`FightPort4.exe`**.

#### Opção B: Instalador Executável (.exe)
1. Baixe o assistente `FightPort4_V2_12.7.0_Setup.exe` nas [Releases oficiais da HKM Team](https://github.com/HKM-Team).
2. Siga os passos na tela escolhendo o local de instalação. Ele criará os atalhos na Área de Trabalho e no Menu Iniciar automaticamente.
3. Abra o jogo direto pelo atalho criado no Desktop!

#### Extração dos Arquivos do Jogo (Primeira Vez)
1. Abra o FightPort 4 e acesse a aba **`EXTRAÇÃO DE PKG`**.
2. Clique no botão **`PROCURAR...`** e selecione o Jogo Base (v1.00) e o Update oficial (v28.00) juntos.
3. Clique em **`Extrair para o Jogo`**: o programa descompacta e mescla tudo automaticamente na pasta `games\UFC4`.
4. Defina seus gráficos e bom combate!

---

## 🎮 Controles & Parsec
- **Reconhecimento Automático:** Suporte Plug & Play para controles de Xbox (One, Series, 360), PlayStation (DualShock 4, DualSense) e genéricos via DirectInput/XInput.
- **Dois Jogadores no Mesmo PC:** O segundo controle entra como Jogador 2 na seleção de atletas.
- **Modo Parsec:** Bloqueio em 60 FPS estáveis de baixa latência para combate 1v1 online com amigos via Parsec.

---

## 🛠️ Como Compilar o FightPort 4
O FightPort 4 é escrito em C puro com a API nativa do Windows (Win32 e GDI+):
1. Abra o prompt do Visual Studio Developer (`vcvars64.bat`).
2. Navegue até a pasta `src\`.
3. Execute `build.bat`:
   ```cmd
   cd src
   build.bat
   ```
4. O executável `FightPort4.exe` será gerado na raiz do projeto.

---

## 📄 Licenças e Avisos Legais
- **FightPort 4 UI & Core:** Licenciado sob a Tri-Licença HKM (MIT, Apache 2.0 e GPLv3).
- **OptiScaler:** Desenvolvido por **nitec** e comunidade, licenciado sob a Licença MIT.
- **SacredFire / shadPS4:** Licenciados sob a GPL v2 ou posterior.
- **Aviso:** Este projeto é um inicializador de código aberto e **não contém arquivos protegidos por direitos autorais do jogo**. O usuário deve fornecer seus próprios arquivos legítimos do EA SPORTS UFC 4. Sem qualquer vínculo ou endosso de Electronic Arts, Sony Interactive Entertainment ou UFC.
