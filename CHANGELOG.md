# 🥊 Funções, Atualizações e Melhorias — FightPort 4 (HKM Team)

Este documento reúne de forma simples, direta e organizada todas as alterações, novidades, recursos adicionados e correções de bugs feitas no **FightPort 4** ao longo do desenvolvimento.

---

## 🌟 Versão V2 (2.12.8.0) (Versão Atual)

A versão **V2 (2.12.8.0)** é a versão oficial de produção do projeto, focada em deixar o jogo ultra-fluido, eliminando gargalos de controle em taxas extremas de quadros (FPS), garantindo inicialização 100% limpa (Estado Zero) e sincronização bidirecional completa.

### 🛠️ Correções de Erros e Bugs Resolvidos na 2.12.8.0
* **Correção do Travamento de Vibração (Rumble) e Perda de Controle com Intel XeFG / MFG:** Corrigido o bug crítico onde o controle ficava vibrando sem parar ou parava de responder após alguns minutos de combate quando os multiplicadores do Intel XeFG (`MFG_UNLOCK_XEFG_ON`) estavam ativos em placas NVIDIA. O inicializador agora configura dinamicamente `LowLatencyOutput = reflex`, desativa a contenção concorrente de sono (`ForceReflex = 0`) no pacing do XeLL e desacopla os sleeps que travavam a fila de pooling do XInput.
* **Integridade e Salvamento de Frame Generation Input (FGInput = upscaler):** Blindada a persistência da entrada de Frame Generation para o motor gráfico do UFC 4. Por se tratar de um port recompilado de console sem suporte nativo a Streamline DLSSG no executável, a injeção opera estritamente através do modo `upscaler` (alimentado pelos vetores de movimento e profundidade do upscaler ativo), impedindo reversões acidentais para `auto` ou `nvngxfg`.
* **Auto-Desbloqueio Inteligente de Multiplicadores XeFG (`[MFGUnlock] XeFG = true`):** Quando selecionado Frame Generation 2X, 3X, 4X ou 6X, o inicializador desbloqueia automaticamente o pipeline de interpolação do XeFG no `OptiScaler.ini`, sincronizando as taxas alvo sem necessidade de edição manual de arquivos.
* **Sanitização Absoluta & Estado Zero (Zero Trace):** Removidos todos os caminhos locais absolutos do ambiente de desenvolvimento no código C (`src/fightport4.c`, `src/pkg_engine.c`), scripts auxiliares (`tools/pkg_tool/extract_runner.py`, `tools/update_optiscaler.ps1`) e desativada a geração de logs locais em tempo real (`LogToFile = false` no `OptiScaler.ini`), garantindo que o programa execute de forma pura, portátil e sem deixar rastros no computador do usuário final.
* **Sincronização Gráfica em Tempo Real Desbloqueada:** Documentação e interface alinhadas: agora é opcional configurar gráficos antes de abrir o jogo ou ajustar em tempo real durante a luta pressionando a tecla `Insert`.

---

## 🚀 Versão V2 (2.12.7.0)

### ⚡ Melhorias Gráficas e Desempenho (Aba "UPSCALE & FG")
* **Suporte a Tecnologias de Imagem Modernas (OptiScaler):** Adicionado suporte oficial aos melhores filtros de imagem do mercado: AMD FSR (1.0, 2.2, 3.1 e 4.1.1), Intel XeSS (1.3 e 2.0) e NVIDIA DLSS (3.5 e 4.5).
* **Mais Fluidez com Gerador de Quadros (Frame Generation):** Opção de dobrar ou multiplicar os quadros por segundo para telas rápidas:
  * AMD FSR 3.1 FG (120 FPS)
  * Intel XeFG (120 FPS)
  * Multi-Frame Generation 3X (180 FPS), 4X (240 FPS) e 6X
  * Modo Dinâmico (ajusta os FPS automaticamente de acordo com os Hz do seu monitor).
* **Renderização por Inteligência Artificial (DLSS 5):** Reconstrução neural avançada focada nos modelos dos atletas (pele, cabelo e barba) para máxima nitidez no octógono.
* **Seletor de Execução & Timing:** Menu dropdown dedicado de sincronização e timing ao lado do DLSS 5.
* **Menos Atraso nos Comandos (Latência Baixa):** Adicionadas tecnologias que fazem os golpes responderem mais rápido no controle (NVIDIA Reflex, AMD Anti-Lag 2, Intel XeLL e limitador próprio).

---

### 🎨 Visual, Usabilidade e Atalhos
* **Botão "Criar Atalho":** Posicionado estrategicamente na tela principal entre "Salvar Configurações" e "Jogar".
* **19 Ícones Exclusivos em Alta Resolução:** Galeria com fotos dos maiores atletas do MMA para a Área de Trabalho (Poatan, Do Bronx, Anderson Silva, Jon Jones, Khabib, McGregor, Aldo, GSP, Makhachev e logo oficial).
* **Atualização Imediata de Atalho no Windows Explorer:** Notificação direta ao subsistema shell (`SHChangeNotify`) para refletir o novo ícone sem reiniciar o Windows.
* **Remoção de Menu Acidental no Controle (L3 + R3):** Desativado o atalho de debug herdado do port upstream que abria menus no meio do combate.
* **Atualizador Integrado do OptiScaler:** Ferramenta dedicada para renovação das DLLs gráficas preservando arquivos de configuração personalizados.

---

### 📦 Instalação e Extração de Arquivos (PKG)
* **Seleção em Botão Único:** Seleção conjunta do Jogo Base (`v1.00`) e Atualização Oficial (`v28.00`) pelo botão `PROCURAR...`.
* **Conferência de Cabeçalhos:** Validação da integridade de `PARAM.SFO` com prevenção de pacotes modificados ("backports") incompatíveis.
* **Proteção de Pastas:** Eliminação de travamentos ou pastas aninhadas duplicadas na descompactação.

---

## 📜 Sobre o Port

### 🔊 Áudio e Sons
* **Vozes e Comentários Nítidos:** Conversão limpa de áudio 7.1 surround para 2 canais estéreo 2.0.
* **Ganho Amplificado:** Controle de volume no inicializador de 50% até 300% com limitador anti-distorção.

### 🎮 Controles e Jogatina em Dupla
* **Dois Jogadores no Mesmo PC:** Suporte a 2 controles simultâneos (Xbox, PlayStation ou genéricos).
* **Modo Parsec:** Trava em 60 FPS com latência ultra-baixa para jogatina online 1v1.

### 💻 Compatibilidade de Hardware
* **Processadores Intel:** Correção de falhas com instruções exclusivas da AMD.
* **Placas de Vídeo Intel Arc:** Correção de artefatos visuais no chão e corpos dos lutadores.
* **Proteção de Savegames:** Prevenção contra falsos corrompimentos de dados causados por leituras concorrentes de antivírus.
