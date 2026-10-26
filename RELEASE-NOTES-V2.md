# FightPort 4 — Versão V2 (2.12.7.0) (Release Notes)

**Data de Lançamento:** Outubro de 2026  
**Status:** Versão Oficial Estável (V2)  
**Versão do Executável:** V2 (2.12.7.0)

---

## 🥊 Principais Destaques da Versão V2 (2.12.7.0)

A versão **V2 (2.12.7.0)** do FightPort 4 é a maior e mais refinada atualização gráfica, tecnológica e de usabilidade lançada para o projeto, integrando o **OptiScaler v0.1.34-with-dlss-fg** diretamente na estrutura do port para fornecer reconstrução gráfica de última geração, múltiplos motores de upscaling (FSR, XeSS e DLSS), geração de quadros (Frame Generation de 120 FPS até 6X), renderização neural (DLSS 5), sincronização total em tempo real e estabilidade aprimorada para sessões contínuas de combate.

---

### 1. Injeção Direta do OptiScaler v0.1.34-with-dlss-fg (Créditos: nitec)
- **Integração no Binário:** O OptiScaler foi integrado através do wrapper de sistema `bin\winmm.dll`, inicializando em conjunto com o motor Vulkan nativo do port (`sacredfire-game.exe`).
- **Arquitetura 100% Vulkan:** O jogo opera exclusivamente sobre a API gráfica Vulkan com swapchain D3D12, eliminando rotinas desnecessárias que causavam instabilidades.
- **Desenvolvimento e Créditos:** Créditos e reconhecimento oficial ao desenvolvedor **nitec** (nitec97 / cdozdil) e à comunidade pela criação do OptiScaler.
- **Bibliotecas Dedicadas:** Inclusão das bibliotecas atualizadas do AMD FidelityFX SDK 4.x, Intel XeSS 2.0 (`libxess.dll`, `libxess_fg.dll`, `libxell.dll`) e NVIDIA NGX DLSS/DLSSG/DLSSNR (build F5 / DLSS-NR).
- **Botão "ATUALIZAR UPSCALE":** Botão integrado diretamente na aba `UPSCALE & FG` com script automatizado (`tools\update_optiscaler.bat` / `.ps1`) capaz de fechar processos do jogo com segurança, atualizar e substituir seletivamente todos os binários do OptiScaler e reabrir o inicializador preservando arquivos e configurações pessoais.

---

### 2. 🔄 Sincronização Total Bidirecional (Launcher & In-Game)
- **Flexibilidade Completa:** Todas as opções de resolução, upscaling, presets de qualidade, geração de quadros e DLSS 5 funcionam de maneira 100% sincronizada.
- **Liberdade de Configuração:** O usuário pode definir suas opções graficamente pelo inicializador FightPort 4 antes de jogar, ou pressionar a tecla **`Insert`** no teclado a qualquer momento durante a luta para alterar parâmetros no menu de sobreposição do OptiScaler em tempo real.
- **Gravação Automática:** Parâmetros alterados dentro do jogo são gravados e refletidos no inicializador, e vice-versa.

---

### 3. "UPSCALE & FG"
- **Motores de Upscale:**
  - AMD FSR 1.0 (espacial ultraleve)
  - AMD FSR 2.2 (temporal equilibrado)
  - AMD FSR 3.1 (temporal avançado com redução de ruídos)
  - AMD FSR 4.1.1 (Super Resolução por IA)
  - Intel XeSS 1.3 (Universal via DP4a para qualquer placa de vídeo)
  - Intel XeSS 2.0 (Alta precisão)
  - NVIDIA DLSS 3.5 (Tensor Cores / RTX)
  - NVIDIA DLSS 4.5 (Headless Enabler)
- **Presets de Escala (Ratio):**
  - Nativo AA (1.0x)
  - Qualidade (1.5x - Recomendado)
  - Equilibrado (1.7x)
  - Desempenho (2.0x)
  - Ultra Desempenho (3.0x)
- **Perfis DLSS (Render Presets por Letra):**
  - Preset C (Lutas e movimentos rápidos)
  - Preset E (Detalhes finos e nitidez)
  - Preset F (Estabilidade temporal em grades e cordas)
  - Preset G (Transformer Pipeline)
  - Preset M (Modelo Convolucional mais recente — sincronizado diretamente com os drivers NVIDIA)
- **Seletor de Execução & Timing:** Menu suspenso dedicado ao lado do DLSS 5 para controle de sincronização de quadros e timing de apresentação.
- **Geração de Quadros (Frame Generation):**
  - Desligado (60 FPS física)
  - AMD FSR 3.1 FG (2X FPS • 120 FPS)
  - Intel XeFG (2X FPS • 120 FPS)
  - Multi-Frame Generation 3X (180 FPS)
  - Multi-Frame Generation 4X (240 FPS)
  - Multi-Frame Generation 6X (Fluidez extrema)
  - Dynamic MFG (Ajuste dinâmico automático com a taxa de Hz do seu monitor)
- **NVIDIA DLSS 5 (Neural Rendering):**
  - Desligado
  - Ligado (NR Only • 1 Pass)
  - Ligado (NR Only • 2 Passes)
  - Ligado (NR + Frame Gen • Auto)
- **Corte Ativo de Latência:**
  - Auto, NVIDIA Reflex, AMD Anti-Lag 2, Intel XeLL, LatencyFlex 2 e FightPort Limiter.

---

### 4. Interface, Atalhos e Personalização
- **Botão "Criar Atalho":** Posicionado estrategicamente na barra inferior da aba CONFIGURAÇÕES, entre "Salvar Configurações" e "Jogar".
- **19 Ícones Exclusivos de Atletas:** Galeria completa com 9 grandes atletas do UFC (Alex Poatan, Charles do Bronx, Anderson Silva, Jon Jones, Khabib Nurmagomedov, Conor McGregor, José Aldo, Georges St-Pierre, Islam Makhachev e logo oficial).
- **Atualização Instantânea no Windows Explorer:** Notificação via `SHChangeNotify` para refletir imediatamente a troca de ícone na Área de Trabalho sem precisar reiniciar o sistema.

---

### 5. Extrator Nativo de Arquivos PKG
- **Seleção em Botão Único:** Seleção conjunta do **Jogo Base v1.00** e da **Atualização 28.00** através de um único clique no botão `PROCURAR...`.
- **Validação de Pacotes:** Leitura do cabeçalho `PARAM.SFO` para garantir integridade e compatibilidade (`CUSA14209` ou `CUSA14204`).
- **Instalação Automática:** Extração e mesclagem direta na pasta `games\UFC4`, com isolamento seguro para prevenir arquivos corrompidos.

---

### 6. Controles e Jogabilidade
- **Reconhecimento Automático:** Suporte Plug & Play para controles Xbox, PlayStation e genéricos.
- **Dois Jogadores no Mesmo PC:** Reconhecimento automático de Player 1 e Player 2.
- **Menu Interno do Port:** Acessível a qualquer momento pelo teclado pressionando a tecla **`Insert`**.
- **Modo Parsec:** Suporte integrado a 60 FPS estáveis de baixa latência para partidas online 1v1 com amigos via Parsec.

---

### 7. Estabilidade e Desempenho
- **Sessões Longas e Trocas de Atletas:** Reforçada a rotina de gerenciamento de memória gráfica, prevenindo travamentos em transições de cutscenes e trocas sucessivas de lutadores.
- **Áudio Cristalino em 2 Canais:** Conversão automática de 7.1 surround para 2.0 estéreo, garantindo vozes e impactos nítidos com volume ajustável até 300%.
- **Registro Oficial da Versão:** Registrado oficialmente como **V2 (2.12.7.0)** no executável `FightPort4.exe` (`app.rc`, janela "Sobre" e propriedades do arquivo).
