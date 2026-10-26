# 🥊 Changelog Oficial — FightPort 4 (HKM Team)

Todas as modificações, adições e correções técnicas relevantes estão documentadas neste arquivo sob os três pilares do projeto.

---

## [2.12.7.0] — V2 Release Oficial (Outubro 2026)

### 🚀 Novidades Autorais (HKM Team)
- **Extrator Assistido de PKG:** Módulo de descompactação e mesclagem automatizada do Jogo Base (`v1.00`) e Atualização (`v28.00`) com conferência de integridade de `PARAM.SFO`.
- **Sincronização em Tempo Real:** Motor bidirecional que sincroniza as escolhas de resolução e filtros entre a interface Win32 do launcher e o menu in-game (tecla `Insert`).
- **Galeria de 19 Ícones & Criador de Atalhos:** Sistema de criação de atalhos no Desktop com notificação imediata do Shell (`SHChangeNotify`) sem reiniciar o Windows.
- **Downmix de Áudio Estéreo com Limitador:** Conversão de canais 7.1 para 2.0 estéreo com ganho ajustável de 50% a 300%.
- **Opções de Distribuição:** Disponibilização tanto em arquivo compacto direto (`FightPort4_V2_12.7.0.zip`) quanto em Instalador Executável (`FightPort4_V2_12.7.0_Setup.exe`) com assistente.

### ⚡ Melhorias nos Drivers & Upscaling (OptiScaler)
- **Injeção do OptiScaler v0.1.34-with-dlss-fg:** Integração direta através de `bin/winmm.dll`.
- **Suporte Multimotor:** AMD FSR (1.0, 2.2, 3.1, 4.1.1), Intel XeSS (1.3, 2.0) e NVIDIA DLSS (3.5, 4.5).
- **Geração de Quadros:** Modos FSR 3.1 FG (120 FPS), XeFG (120 FPS), Multi-Frame Generation (3X, 4X, 6X) e Dynamic MFG.
- **Renderização Neural (DLSS 5):** Passes múltiplos de IA para reconstrução ótica.
- **Script de Atualização Contínua:** Ferramenta dedicada para renovação dos binários gráficos sem perda de configurações do usuário.

### 🛠️ Ajustes no Port (Runtime & Estabilidade)
- **Otimização de Memória no Modo Carreira:** Eliminação de travamentos em transições de cutscenes longas.
- **Compatibilidade Vulkan:** Ajuste de sincronização de buffers para alternância sem falhas entre Mailbox e V-Sync FIFO.
- **Correções para Plataformas Intel:** Solução de travamentos decorrentes de instruções legadas em CPUs Intel e correção de artefatos visuais em GPUs Intel Arc.
- **Proteção de Savegames:** Prevenção contra falsos erros de arquivos corrompidos durante checagens de antivírus em tempo real.
