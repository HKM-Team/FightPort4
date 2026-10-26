# UFC 4 native port — Windows

Port nativo do **EA SPORTS UFC 4** (PlayStation 4, `CUSA14209` ou `CUSA14204`, update oficial **28.00**), executado sob uma camada de compatibilidade gráfica nativa em Vulkan de alto rendimento. **Não contém arquivos protegidos do jogo**: você precisa fornecer sua própria cópia legítima do jogo.

O que mudou nesta versão: consulte `RELEASE-NOTES.md` ou o inicializador `FightPort4.exe` na raiz do projeto.

---

## Requisitos

- **Sistema:** Windows 10 (1903+) ou 11, 64-bit; processador com conjunto de instruções AVX (Intel ou AMD).
- **Placa de Vídeo:** Compatível com Vulkan 1.3 (NVIDIA GeForce, AMD Radeon ou Intel Arc).
- **Arquivos do Jogo:** Jogo Base v1.00 (`CUSA14209` ou `CUSA14204`) e Atualização Oficial Update 28.00 (em formato `.pkg` para extração automática ou arquivos já descompactados na pasta).

---

## Como Jogar

1. Utilize sempre o inicializador oficial **`FightPort4.exe`** localizado na pasta raiz do projeto.
2. **Para extrair os arquivos do jogo (primeira execução):**
   - Abra o **`FightPort4.exe`**.
   - Acesse a aba **`EXTRAÇÃO DE PKG`**.
   - Clique no botão **`PROCURAR...`** e selecione os dois arquivos PKG juntos (o Jogo Base e a Atualização 28.00). O programa confere os dados e valida o cabeçalho `PARAM.SFO`.
   - Clique em **`Extrair para o Jogo`**: o FightPort 4 descompacta e sobrepõe a atualização automaticamente dentro desta pasta (`games\UFC4`).
3. Na aba **`CONFIGURAÇÕES`** e **`UPSCALE & FG`**, defina suas resoluções, limite de FPS, motor de upscaling e geração de quadros preferidos.
4. Se desejar, clique no botão **`CRIAR ATALHO`** (na barra inferior da aba Configurações) para criar um atalho na Área de Trabalho com a foto do seu lutador favorito.
5. Clique em **`JOGAR`** no FightPort 4 ou abra direto pelo seu atalho criado no Desktop!
6. **Dados, Saves e Logs:** Ficam salvos de forma limpa em `%LOCALAPPDATA%\UFC4Native`.
7. **Dois Jogadores no Mesmo PC:** Conecte dois controles ao computador (Xbox, PlayStation ou genéricos, inclusive via Parsec). O segundo controle entra como Jogador 2 na seleção de lutadores. O menu de status pode ser aberto a qualquer momento pelo teclado pressionando a tecla **`Insert`**.

---

## OptiScaler v0.1.34-with-dlss-fg (Upscaling, Frame Generation e DLSS 5)

O port inclui a injeção nativa do **OptiScaler v0.1.34-with-dlss-fg** (desenvolvido por **nitec** e comunidade, https://github.com/cdozdil/OptiScaler) através do wrapper `bin\winmm.dll`.

Ele disponibiliza:
- **Upscaling Universal:** AMD FSR 1.0 a 4.1.1, Intel XeSS 1.3 e 2.0, NVIDIA DLSS 3.5 e 4.5.
- **Geração de Quadros (Frame Generation):** FSR 3.1 FG (120 FPS), Intel XeFG (120 FPS), Multi-Frame Generation (3X 180 FPS, 4X 240 FPS, 6X) e Dynamic MFG.
- **NVIDIA DLSS 5 (Neural Rendering):** Reconstrução neural multipass de IA (1 pass, 2 passes e NR + Frame Gen).
- **Redução Ativa de Latência:** NVIDIA Reflex, AMD Anti-Lag 2, Intel XeLL, LatencyFlex 2 e limitador próprio.

> **Sincronização em Tempo Real (Launcher & In-Game):**
> Todas as opções de Upscaling, Presets de Qualidade, Geração de Quadros e DLSS 5 funcionam com sincronização total. Você pode configurá-las previamente pela aba **`UPSCALE & FG`** do **FightPort 4** ou alterá-las em tempo real durante a luta abrindo o menu de sobreposição do OptiScaler através da tecla **`Insert`** no teclado. Ambas as interfaces gravam e compartilham as mesmas configurações.

---

## Desempenho & Fluidez

- **Taxas de Quadros:** O jogo roda com física estável a 60 FPS base e alcança 120 FPS até 240 FPS fluidos através dos motores de Geração de Quadros (FSR 3.1 FG, Intel XeFG e Multi-Frame).
- **Compilação de Shaders e Primeira Inicialização:**
  - **Stuttering Inicial:** Na primeira execução, é totalmente normal notar pequenos engasgos (*stuttering*) nos primeiros 2 minutos enquanto a GPU compila e armazena os shaders em disco (`%LOCALAPPDATA%\UFC4Native\user\cache`). Concluído o carregamento inicial, o jogo roda 100% liso. Da segunda inicialização em diante, o jogo já inicia liso imediatamente.
  - **Fechamento Único Pontual de 1ª Execução:** Durante a compilação inicial na primeira vez em que é aberto, o jogo pode eventualmente fechar sozinho após alguns minutos. Basta reabrir o jogo: a partir da segunda execução ele roda contínuo e estável sem fechar (ou pode iniciar liso logo de primeira sem qualquer fechamento).
  - **Troca entre Mailbox e V-Sync FIFO:** A alternância entre os modos de apresentação *Mailbox* e *V-Sync FIFO* reinicia a cadeia de sincronização da GPU. Por isso, ao alternar entre eles, pode ocorrer novamente esse fechamento pontual único após algum tempo jogado na primeira partida do novo modo. Caso ocorra, basta reabrir para continuar jogando normalmente com estabilidade total.

---

## Áudio e Volume

O áudio original é mixado em 7.1 surround. Em caixas de som e fones estéreo normais, o port realiza a conversão automática para 2 canais estéreo sem atenuar vozes, narração e impactos de golpes. Use o controle de **Volume** no FightPort 4 (50% a 300%; com limitador integrado contra distorções).

---

## ReShade (Opcional)

O port opera em Vulkan nativo e suporta o ReShade (https://reshade.me):
1. Execute o instalador do ReShade e aponte para o executável `bin\sacredfire-game.exe` dentro da pasta `games\UFC4`.
2. Em "Rendering API", selecione **Vulkan** e instale os pacotes de efeitos desejados.
3. Inicie o jogo pelo **FightPort 4**; a tecla **`Home`** abre o menu do ReShade.

---

## Avisos Legais

Este projeto é um inicializador e port de código aberto licenciado sob a GNU GPL v2 ou posterior. Sem qualquer afiliação ou endosso de Electronic Arts, Sony Interactive Entertainment ou UFC. Licenças de terceiros disponíveis na pasta `licenses\`.
