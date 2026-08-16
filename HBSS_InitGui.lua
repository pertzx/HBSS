local InitGuiModule = {}
local InitGui = {}
InitGui.__index = InitGui

function InitGui.new()
    local self = setmetatable({}, InitGui)
    self.statusMessages = {
       "buscando arquivos de recursos aleatórios...", "obtendo URLs...", "fazendo coisas...", "compilando código espaguete...", "pedindo ajuda ao Gpssickle...", "carregando a parte engraçada...", "GS.exe está fazendo algo...", "verificando se o GS é apenas pedras britadas...", "invocando a pá...", "comendo areia...", "triturando pedras...", "isso definitivamente não é um vírus...", "rezando para os deuses do RNG...", "encontrando o inimigo mais próximo...", "tá tudo bem... tá tudo certo...", "renderizando a parte engraçada...", "inicializando o GS quântico...", "carregando o ingrediente secreto...", "invadindo o mainframe...", "transformando pedras em aimbot...", "não sei o que estou fazendo...", "por favor, aguarde... estou fazendo o meu melhor...", "ok, vou carregar agora...", "enviando uma atualização de 3,5 GB... brincadeira", "fazendo GS...", "essa é a centésima mensagem de status, aliás...", "encarando o código...", "torcendo para funcionar...", "não é um vírus, eu prometo...", "rezando para a foice GPS...", "meu código é uma massa...", "al dente e todo emaranhado...", "bom apetite..."
    }
    self.dotCount = 0
    self.dotTask = nil
    self.statusTask = nil
    self.scrollTask = nil
    self.gui = nil
    self.bg = nil
    self.title = nil
    self.status = nil
    self.dots = nil
    self.codeBackground = nil
    self.codeScroller = nil
    return self
end

function InitGui:create()
    local gui = Instance.new("ScreenGui")
    gui.Name = "InitializingGui"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = game:GetService("CoreGui")
    self.gui = gui

    local bg = Instance.new("Frame")
    bg.Size = UDim2.fromScale(1, 1)
    bg.BackgroundColor3 = Color3.new(0, 0, 0)
    bg.BackgroundTransparency = 0.7
    bg.Parent = gui
    self.bg = bg
    local codeBg = Instance.new("Frame")
    codeBg.Size = UDim2.fromScale(0.45, 1)
    codeBg.Position = UDim2.fromScale(0, 0)
    codeBg.BackgroundTransparency = 1
    codeBg.ClipsDescendants = true
    codeBg.Parent = bg
    self.codeBackground = codeBg

    local codeScroller = Instance.new("ScrollingFrame")
    codeScroller.Size = UDim2.fromScale(1, 1)
    codeScroller.BackgroundTransparency = 1
    codeScroller.BorderSizePixel = 0
    codeScroller.ScrollBarThickness = 0
    codeScroller.VerticalScrollBarInset = Enum.ScrollBarInset.None
    codeScroller.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
    codeScroller.CanvasSize = UDim2.fromOffset(0, 0)
    codeScroller.Parent = codeBg
    self.codeScroller = codeScroller
    local configCode = [[
local config = {
    confIg = "GS",
    startsa = false,
    fovsize = 120,
    predic = 1,
    hbtrans = 1,
    scaleToScreen = false,
    stsdistance = 0,
    SA2_Enabled = false,
    SA2_Method = "Raycast",
    SA2_TeamTarget = "Enemies",
    SA2_Wallcheck = false,
    SA2_TargetPart = "Head",
    SA2_HitChance = 100,
    SA2_FovRadius = 100,
    SA2_FovVisible = true,
    SA2_FovTransparency = 0.90,
    SA2_FovColor = Color3.new(0, 0, 0),
    SA2_FovColourTarget = Color3.new(1, 1, 0),
    SA2_FovIsTargeted = false,
    SA2_ThreeSixtyMode = false,
    SA2_GetTarget = "Closest",
    SA2_currentTarget = nil,
    SA2_TArea = 35,
    SA2_TargetRange = 1000,
    SA2_Wallbang = false,
    SA2_BulletTeleport = false,
    currentTarget = nil,
    espc = Color3.fromRGB(255, 182, 193),
    esptargetc = Color3.fromRGB(255, 255, 0),
    espteamc = Color3.fromRGB(0, 255, 0),
    rfd = false,
    eme = true,
    wallc = false,
    bodypart = "Head",
    espon = false,
    prefTextESP = false,
    highlightesp = false,
    prefHighlightESP = false,
    prefBoxESP = false,
    prefHealthESP = false,
    prefColorByHealth = false,
    espMasterEnabled = false,
    prefHeadDotESP = false,
    lineESPEnabled = false,
    lineESPOnlyTarget = false,
    lineStartPosition = "Center",
    lineColor = Color3.fromRGB(255, 255, 255),
    lineThickness = 1,
    lineESPData = {},
    originalSizes = {},
    activeApplied = {},
    espData = {},
    highlightData = {},
    currentTarget = nil,
    targethbSizes = {},
    fovc = Color3.fromRGB(100, 0, 0),
    fovct = Color3.fromRGB(255, 255, 0),
    playerConnections = {},
    characterConnections = {},
    targetMode = "Enemies",
    centerLocked = {},
    hitchance = 100,
    maxExpansion = math.huge,
    aimbotEnabled = false,
    aimbotFOVSize = 70,
    aimbotStrength = 0.5,
    aimbotWallCheck = false,
    aimbotTargetPart = "Head",
    aimbotTeamTarget = "Enemies",
    aimbotCurrentTarget = nil,
    aimbotFOVRing = nil,
    hitboxEnabled = false,
    hitboxSize = 10,
    hitboxTeamTarget = "Enemies",
    hitboxExpandedParts = {},
    hitboxOriginalSizes = {},
    hitboxLastSize = {},
    hitboxColor = Color3.fromRGB(255, 255, 255),
    antiAimEnabled = false,
    raycastAntiAim = false,
    antiAimTPDistance = 3,
    antiAimAbovePlayer = false,
    antiAimAboveHeight = 10,
    antiAimBehindPlayer = false,
    antiAimBehindDistance = 5,
    originalPosition = nil,
    isTeleported = false,
    currentAntiAimTarget = nil,
    antiAimOrbitEnabled = false,
    antiAimOrbitSpeed = 5,
    antiAimOrbitRadius = 5,
    antiAimOrbitHeight = 0,
    masterTeamTarget = "Enemies",
    autoFarmEnabled = false,
    autoFarmDistance = 10,
    autoFarmSpeed = 1,
    autoFarmTargets = {},
    currentAutoFarmTarget = nil,
    autoFarmLoop = nil,
    autoFarmIndex = 1,
    autoFarmCompleted = {},
    autoFarmTargetPart = "Head",
    autoFarmAlignToCrosshair = true,
    autoFarmVerticalOffset = 0,
    autoFarmMinRange = 0,
    autoFarmMaxRange = 50,
    autoFarmOriginalPositions = {}, 
    autoFarmWallCheck = false,
    aimbot360Enabled = false,
    aimbot360OriginalFOV = 100,
    gp = 200,
    gp2 = 1,
    customFOVEnabled = false,
    customFOVValue = 70,
    fbenabled = false,
    targetSeenSwitchRate = 0.2,
    lastTargetSwitchTime = 0,
    targetSeenTargets = {},
    aimbot360Omnidirectional = true,
    aimbot360BehindRange = 180,
    aimbot360WasEnabled = false,
    masterTarget = "Players",
    clientMasterEnabled = false,
    clientWalkSpeed = 16,
    clientJumpPower = 50,
    clientNoclip = false,
    clientCFrameWalkEnabled = false,
    clientCFrameSpeed = 1,
    clientConnections = {},
    clientOriginals = {},
    _tpwalking = false,
    clientWalkEnabled = false,
    clientJumpEnabled = false,
    clientNoclipEnabled = false,
    clientCFrameWalkToggle = false,
    masterGetTarget = "Closest",
    aimbotGetTarget = "Closest",
    silentGetTarget = "Closest",
    antiAimGetTarget = "Closest",
    autoFarmPartClaimStarted = false,
    autoFarmLastRefresh = 0,
    ignoreForcefield = true,
    QuickToggles = false,
    QTDrag = true,
    trussEnabled = false,
    trussPart = nil,
    trussConnection = nil,
    airwalkEnabled = false,
    airwalkPart = nil,
    airwalkConnection = nil,
    autorespawnEnabled = false,
    autorespawnConnections = {},
    autorespawnDeathPosition = nil,
    autorespawnType = "SetSpawnPoint",
    SSEnabled = false,
    SpawnLocation = nil,
    SSConnection = nil,
    fastspawn = false,
    antiafk = false,
    Viewing = false,
    camYOffsetEnabled = false,
    camYOffsetValue = 0,
    camYOffsetOriginalCFrame = nil,
    camYOffsetConnection = nil,
    spinbot = {
        enabled = false,
        speed = 50,
    },
    bhop = {
        enabled = false,
        jumpDelay = 0.05,
        quickToggleEnabled = false,
        quickToggleDraggable = true
    },
    reach = {
        enabled = false,
        type = "Sphere",
        distance = 10,
        autoSwing = {
            enabled = false,
            delay = 0.1
        },
    },
    visualizer = {
        enabled = false,
        color = Color3.fromRGB(255, 0, 0),
        material = "ForceField",
        transparency = 0.6
    },
    materials = {
        ["ForceField"] = Enum.Material.ForceField,
        ["Plastic"] = Enum.Material.Plastic,
        ["Glass"] = Enum.Material.Glass,
        ["Neon"] = Enum.Material.Neon,
        ["SmoothPlastic"] = Enum.Material.SmoothPlastic,
        ["Metal"] = Enum.Material.Metal,
        ["DiamondPlate"] = Enum.Material.DiamondPlate
    },
    LowRender = false,
    tbot = {
        enabled = false,
        delay = 0.1,
        fovRadius = 150,
        fovVisible = true,
        fovColor = Color3.fromRGB(255, 0, 0),
        fovTransparency = 0.7,
        targetPart = "Head",
        wallCheck = false,
        hitChance = 100,
        holdToShoot = false,
        holdKey = "MouseButton1"
    },
    KeybindsEnabled = true,
    HoldKeysEnabled = false,
    Keybinds = {
        HoldKeybind = "LeftAlt",
        silentaim = "E",
        aimbot = "Q",
        autofarm = "F",
        antiaim = "L",
        hitbox = "G",
        esp = "Z",
        client = "N",
        silentaimwallcheck = "B",
        aimbotwallcheck = "H",
        silentaimhk = "R",
        silentaimhkwallcheck = "T",
        triggerbot = "X",
        bhop = "V",
        tbotwallcheck = "Y",
    },
    varibz = {
        btntitle = {
            "ei, me fecha",
            "o tamanho da GUI diminui",
            "cara",
            "é",
            lp_info.lp_displayname,
            "que atitude 'GS' a sua",
            "interface super sólida",
            "o quê",
            "versão: sei lá",
            "D:",
            "me reabre AGORA!!! D:",
            "é só trapacear para passar",
            "tigela",
            "cadê o GTA 6?",
            "caramba",
            "open4robuc",
            "quero ficar aberto",
            "GS não é areia",
            "será que GS é só areia?",
            "boa sorte",
            "não é totalmente à prova de banimento",
            "bleh :p",
            ":3",
            ":o",
            ";]",
            "código de erro: 6967420",
            "🥀💔✌️🫩",
            "parceiro",
        },
        convo = {
            {
                typesp = "1.5",
                "EI",
                "{displayname} EI",
                "Ok, já chamei sua atenção",
                "o que eu quero dizer é",
                "por favor, leia a aba de informações :(",
                "e me dê os créditos se você usou algum trecho do código :(",
            },
            {
                "sand.cc é um jogador de GS",
                "ele é um jogador de GS de verdade",
                "sand joga GS",
            },
            {
                "Pessoal, ele está usando hack, DENUNCIEM",
                "TODO MUNDO SPAMA DENÚNCIA NELE",
                "HACKER, DENÚNCIAAAA",
            },
            {
                "steam",
                "para de tentar matar a gente :(",
                "vidas de hackers importam",
            },
            {
                typesp = "2",
                "EU SOU UM CIRURGIÃO",
                "EU SOU UM CIRURGIÃO",
                "EU SOU — EU SOU UM CIRURGIÃO",
                "EU SOU UM CIRURGIÃO",
            },
            {
                typesp = "2",
                "eu sou um arquiteto, porra",
                "que merda, eu tô travado",
                "vendendo móveis de merda",
                "porque tem gente que não levanta",
                "a bunda gorda e de merda e vem me ajudar.",
            },
            {
                typesp = "2",
                "Retire a fita, aperte o botão de reiniciar,",
                "Um labirinto no qual me perdi,",
                "Não importa como eu avance, é um fardo,",
                "Além da porta, vi minhas próprias costas\nAo me virar, vi você,",
                "Onde fica o fim do inferno?\nA saída ainda não está à vista?",
                "Girando, girando, girando,\nRepetindo, repetindo, repetindo,",
                "Oscilando, oscilando,\nFractal, fractal, fractal, fractal,",
                "em um loop pelos cômodos\ntipo assim 💔",
            },
            {
                "conversão de proto",
                "pra ser sincero, nem sei o que estou dizendo",
            },
            {
                "alt+f4 = robux grátis",
                "vai por mim, funciona",
                "funciona 101%, tenho certeza",
            },
            {
                "quem é você",
                "é, tipo, quem é você",
                "você é usuário do GS?",
                "hmmmm, então tá bom",
            },
            {
                typesp = "1.5",
                "Meu rival,",
                "Meu ídolo,",
                "Você me deixa suicida",
                "Meu amor, sua fúria",
                "Nossas agonizantes reivindicações de fama",
                "Nossa batalha lendária,",
                "Nossa confraternização inconstante,",
                "Uma guerra dentro do meu coração.",
                "Até que ###### nos separe",
                "Bang, Bang, Bang, Bang",
                "Até eu te derrubar...",
                "Para baixo, para baixo, para baixo, para baixo",
                "Eu quero você enterrado!",
            },
            {
                "Aff, esta cozinha é\ntão difícil de limpar",
                "Quem dera houvesse um jeito mais fácil!",
                "",
                "Olá, eu sou Derek Baum,\ndiga adeus às manchas diárias e superfícies sujas",
                "com a nova KITCHEN GUN!!",
                "Esta pia está imunda",
                "mas basta 3 tiros da KITCHEN GUN",
                "BANG!, BANG!, BANG!",
                "e ela brilha como nova!",
            },
            {
                "Este vaso sanitário é tão difícil de limpar!",
                "Deve haver um jeito mais fácil",
                "",
                "Olá! Eu sou Derek Baum e declaro guerra\naos vasos sanitários com a nova TOILET GRENADE",
                "basta puxar o pino, jogá-la na privada,\nabaixar a tampa",
                "e deixar a TOILET GRENADE fazer o resto!",
                "BAAAAANNNNGGG!!!!",
            },
            {
                "",
            },
            {
                typesp = "2",
                "Meu pão ficou\ncarbonizado",
                "Não é como se estivesse intragável\nou algo assim, eu acho...",
                "Eu queria que estivesse fofinho como sempre\nse ao menos não tivesse queimado...",
                "Acho que não adianta querer isso agora...",
                "",
                "Meu pão ficou\ncarbonizado",
                "Está duro feito pedra...",
                "Não que esteja intragável\nou algo assim, eu acho...",
                "Espero mesmo que não\nqueime amanhã",
                "Deve ficar melhor, né?",
                "Acho que não adianta querer isso agora...",
            },
            {
                "sua pontuação retroslop é {retroscore}",
                "é, tô falando sério",
                "pra ser sincero... nem ligo rsrs tá tudo bem {displayname}",
            },
            {
                "sou mais preguiçoso que a LazyTown",
                "é literalmente esse o meu nível de preguiça",
                "é verdade, mas também não é",
                "tá, tanto faz",
            },
            {
                typesp = "2.5",
                "Você fez suas tarefas?",
                "Com certeza!",
                "Você fez suas tarefas?",
                "Com certeza!",
                "Você fez suas tarefas?",
                "Com certeza!",
                "Quando eu chegar em casa, é bom que esteja tudo limpo!",
                "Você fez suas tarefas?",
                "Com certeza!",
                "Você fez suas tarefas?",
                "Com certeza!",
                "Você fez suas tarefas?",
                "Com certeza!",
                "GAROTO, POR QUE VOCÊ MENTIU PRA MIM?",
                "AHHHHHH",
            },
            {
                typesp = "1.5",
                "Ei, {displayname}, vem cá",
                "vem cá,\nvem cá",
                "Olha só meus tênis novos,",
                "São os novíssimos-",
                "1-2, Aperto o cadarço",
                "3-4, Aperto mais um pouco",
                "5-6, Tênis da Nike",
                "Nossa, isso ficou muito brabo",
            },
            {
                "''Ei, sou eu, a Verity''",
                "''Me pergunte QUALQUER COISA!''",
                "Tenho uma pergunta",
                "''Eu sei um milhão de coisas''",
                "Que ótimo!",
                "''Eu faço TUDO!''",
                "Beleza!",
                "Qual é a capital da França?",
                "''Oh, oui oui oui''",
                "''É Paris''",
                "",
                "Horror Skunx, você\nnão tá com nada com isso",
            },
            {
                typesp = "2.3",
                "Eu curto festa como se tivesse 21! CX",
                "20?",
                "21!",
                "Eu curto festa como se tivesse 21! :D",
                "20?",
                "21! :v",
                "20?",
                "20?",
                "21! :c",
                "20?",
                "20?",
                "21! D:",
                "20?",
                "20?",
                "21! D:",
                "2-2-2-2?",
                "21! o_O",
                "20?",
                "20?",
                "21! ^⁠_⁠^",
                "20?",
                "20?",
                "21! :3",
                "20?",
                "20?",
                "21? :p",
                "2-2-2-2?",
                "20?",
                "21?",
            },
            {
                typesp = "1.5",
                "Erro: (mensagem não encontrada)",
                "Erro: (mensagem não encontrada)",
                "Erro: (mensagem não encontrada)",
                "Na verdade, não estou tendo erros",
                "ou talvez esteja, quem sabe??",
            },
            {
                "a autoridade do servidor",
                "tá com muito lag :c",
                "tipo, mano??? por que tá com tanto lag :(((",
            },
            {
                typesp = "2.5",
                ":o",
                ":)",
                ";)",
                ";D",
            },
            {
                "Mamãe, posso comer um biscoito?",
                "Não, Diabeto, volte rolando para a cozinha",
                "ahhhhhhhhhhh :(",
            },
            {
                typesp = "1.5",
                "ACABEI DE GANHAR",
                "O PRÊMIO GRANDEEEEE",
                "EI, EI, EI, EI, EI",
                "ACABEI DE GANHAR O PRÊMIO GRANDE",
            },
            {
                "Eu não diria que o GS é o melhor",
                "sei lá, pode haver outros scripts",
                "que são verdadeiras joias escondidas",
                "bom, talvez o GS seja um deles :v",
            },
            {
                typesp = "2",
                "Todas as suas bases pertencem a nós",
                "11113333777",
                "O PATO ÉPICO ESTÁ CHEGANDO!!!",
                "SAI DO MEU GRAMADO",
                "ROFL",
                "{userid}",
                "Muahahahaha!",
            },
            {
                "a idade da sua conta é {accountage}",
                "nem sei por que estou dizendo isso",
            },
            {
                typesp = "1.5",
                "se você prestar bastante atenção",
                "você vai acabar sendo um vilão",
                "você tem que perseguir um herói",
                "e vê-lo cair de 1 a 0",
                "apenas siga meus movimentos",
                "e você estará pronto-",
                "para sair e agir na surdina",
                "só tome cuidado",
                "para não fazer nenhum barulho",
                "enquanto esse super-herói estiver-",
                "por aí",
                "agora vamos lá e vamos caçá-lo!",
                "",
                "essa música é demais, {displayname}?",
            },
            {
                "me fala um vilão fictício\nque ninguém odeia",
                "é o Robbie Rotten",
            },
            {
                "du bist gut genug...",
                "Ich weiß nicht,",
                "was die welt die sagt",
                "bleib einfach nur du,",
                "du bist gut genug!",
                "du bist gut genug!",
                "du bist gut genug!",
                "du bist gut genug!",
                "*música de fogo*",
            },
            {
                typesp = "1.5",
                "shimmy ey, shimmy ey, yaaa~",
                "drake.. Swalalala.. drake",
                "swalalala.. swalalala *beat doente*",
                "*música doente*... continua seguindo yah",
            },
            {
                "Mano, esse código tem mais de 15000 linhas :(",
                "Eu ''não consigo'' fazer essa porra :[",
                "por favor, me ajuda {displayname}",
            },
            {
                "Cframe view é apelão",
                "por favor, testa {displayname}",
                "você vai gostar :3",
            },
            {
                "Aimware",
                "isso é realmente aimware??",
                "quem sabe",
                "talvez seja",
            },
            {
                typesp = "3",
                ":3",
                ">:3",
                ":3",
                ">:3",
                ":3",
                ">:3",
                ":3",
                ">:3",
                ":3",
                ">:3",
                ":3",
                ">:3",
                ":3",
                ">:3",
                "^w^",
            },
            {
                "GS fofo :3",
                ":3 :3",
                ":3:3:3:3:3:3:3:3:3:3:3",
            },
            {
                typesp = "1.5",
                "Não levei isso bem.",
                "Não levei isso bem.",
                "Pareceu!",
                "Não levei isso bem.",
                "Não levei isso bem.",
                "Pareceu!",
                "Não levei isso bem.",
                "Não levei isso bem.",
                "Pareceu!",
            },
            {
                typesp = "1.5",
                "De alguma forma vejo o que é bonito,",
                "Em coisas que são efêmeras",
                "Será que sou apenas amigo de mim mesmo",
                "O amor é apenas.. um pedaço de tempo\nno mundo",
                "No mundo",
                "E eu não pude deixar de me apaixonar\nde novo",
            },
            {
                "Na verdade eu não tô falando com você",
                "mas eu tô falando com você",
                "isso faz algum sentido :s",
                "provavelmente não",
            },
            {
                "você tá hackando??",
                "Acho que você tá hackando",
                "sim, você definitivamente tá hackando",
            },
            {
                "você foi ratted.",
                "Tô falando sério",
                "você foi ratted",
                "Tô brincando kkk",
            },
            {
                "seu número de seguridade social\né [{userid}]",
                "não, mas sério, é",
                "Tô brincando",
                "que diabos é {userid} :b",
                "ah espera, esse é seu userid, minha culpa",
            },
            {
                "o GS é só pedras trituradas?",
                "tipo, sério???",
                "o GS poderia ser só pedras trituradas",
            },
            {
                "hbss significa:",
                "heybuddystopstealing",
                "sim, é isso que significa",
            },
            {
                "Eu tenho 101% de certeza que você vai gostar do GS :3",
                "tipo, eu tenho tanta certeza assim",
                "(por que eu tô me auto-elogiando)",
            },
            {
                "Eu funciono melhor em shooters genéricos",
                "se não for um shooter genérico",
                "eu posso quebrar",
            },
            {
                "por que o http 429 é meu inimigo",
                "EU JURO POR DEUS",
                "toda vez que eu carrego o GS",
                "ele me dá um 429",
                "tipo, mano, relaxa",
            },
            {
                "renderstepped é pra chuds",
                "gang do heartbeat, cadê vocês",
                "renderstepped me deixa com lag",
                "heartbeat liso como manteiga",
            },
            {
                "alguém disse espaguete",
                "meu código é macarrão",
                "al dente e todo emaranhado",
                "bom apetite",
            },
            {
                "usuários de synapse x be like",
                "cadê meu script",
                "script foi executado",
                "por um exploit de 2017",
                "aqueles eram os dias",
            },
            {
                "erros de nil são minha paixão",
                "tentativa de indexar nil",
                "meu erro favorito",
                "me pega toda vez",
            },
            {
                "se você ver um erro de sintaxe",
                "só executa de novo",
                "vai se consertar sozinho",
                "confia em mim, mano",
            },
            {
                "o limite de 200 variáveis",
                "é meu demônio da paralisia do sono",
                "eu acordo gritando",
                "às 3 da manhã pensando nisso",
            },
            {
                "quando a biblioteca de UI atualiza",
                "e tudo quebra",
                "eu ''adoro'' reescrever código",
                "ninguém nunca disse isso",
            },
            {
                "print() são superestimados demais",
                "tipo, mano, é só... nem sei :/",
            },
            {
                "jogadores de blox fruits be like",
                "isso funciona em blox fruits",
                "não, é pra shooters genéricos",
                "por favor, aprende a ler",
            },
            {
                "diferença de cadeira gamer de verdade",
                "eu tenho a cadeira de 4000$",
                "por isso eu nunca erro",
                "totalmente não é aimbot",
                "ou silentaim",
                "ou hitbox",
                "ou [insira recurso aqui]",
            },
            {
                "jogadores de csgo tiltando",
                "quando eu acerto um 360 no scope",
                "a piada é pra eles",
                "eu nem jogo csgo",
                "Eu jogo shooters do Roblox",
                "igual você {displayname}",
            },
            {
                "eu e os manos",
                "executando o script",
                "e tomando ban",
                "valeu a pena toda vez",
            },
            {
                "salve pros devs",
                "que fazem isso possível",
                "nós agradecemos",
                "ah espera, sou eu :v",
            },
            {
                "eu debugando às 2 da manhã",
                "por que não tá funcionando",
                "ah, eu esqueci uma vírgula",
                "vou dormir",
            },
            {
                "half life 3 confirmado",
                "o GS confirmou",
                "confia em mim, mano",
                "meu tio trabalha na valve",
            },
            {
                "o script é de graça",
                "e de código aberto",
                "e tem silent aim",
                "o que mais você poderia querer",
            },
            {
                "eu amo quando o script",
                "funciona na primeira tentativa",
                "isso é mentira",
                "nunca funciona",
            },
            {
                "o limite de 200 variáveis é",
                "meu arqui-inimigo",
                "nós temos rixa",
                "começou em 2024",
            },
            {
                "o script é mantido unido",
                "por puro ódio",
                "e cafeína",
                "principalmente cafeína",
            },
            {
                "Você sabia",
                "Água contém oxigênio",
                "então você poderia respirar debaixo d'água",
            },
            {
                "isso é um hack",
                "não, é uma cadeira gamer",
                "minha cadeira tem aimbot",
                "você deveria comprar uma",
            },
            {
                "GS tem 0 calorias pra queimar",
                "então sim {displayname}, é por isso\nque o GS consegue fazer isso",
            },
            {
                "espera, isso não é um vírus",
                "me disseram que era um vírus",
                "é código aberto",
                "você pode literalmente ler",
            },
            {
                typesp = "1.5",
                "ei {displayname}",
                "sim, você",
                "aquele que tá lendo isso",
                "como tá seu dia?",
                "o meu tá GSy :p",
                "entendeu?",
                "GSy?",
                "tipo GS?",
                "ok, vou parar",
            },
            {
                typesp = "1.5",
                "então, uh",
                "{displayname}, você já",
                "olhou pra uma pedra",
                "e pensou 'uau'",
                "sou eu",
                "eu sou a pedra",
                "o GS especificamente",
                "prazer em te conhecer :3",
            },
            {
                typesp = "2",
                "você provavelmente tá usando isso",
                "pra destruir umas crianças",
                "num jogo do roblox",
                "eu respeito isso",
                "se fodeu nerd >:D",
                "haha, tô brincando",
                "ou será que não?",
                ";)",
            },
            {
                typesp = "1.5",
                "psst",
                "ei",
                "aqui",
                "sim, você",
                "quer saber um segredo?",
                "o GS é feito de",
                "pedras trituradas",
                "mente explodida :o",
            },
            {
                typesp = "1.5",
                "você é um hacker?",
                "porque você parece sus",
                "espera, eu sou o script",
                "eu literalmente tô hackando\npra você",
                "eu sou o sus",
                "minha culpa :p",
            },
            {
                "mastermz por favor\nmostra meu script",
                "por favorzinho",
                "tipo, super por favorzinho",
            },
            {
                "você já",
                "abriu um script",
                "e ele funcionou",
                "de primeira?",
                "sim, eu também não",
                "essa é tipo a minha 50ª versão",
                "não falamos da v1\nah sim, g.cc não tem versões...",
            },
            {
                typesp = "1.5",
                "se você tomar ban",
                "não me culpa",
                "eu sou só uma pedra",
                "pedras não podem ser culpadas",
                "é a lei",
                "eu acho",
                "eu não li",
            },
            {
                "qual é seu tipo",
                "de pedra favorito?",
                "o meu é o GS obv",
                "mas ígnea é legal também",
                "pumice flutua",
                "isso é doido",
                "a natureza é louca :o",
            },
            {
                typesp = "2",
                "você acha que tá pronto",
                "pra experiência GS?",
                "você acha que tá pronto",
                "pro SILENT AIM??",
                "você acha que tá pronto",
                "pro HITBOX??",
                "provavelmente não :P",
            },
            {
                "algumas pessoas usam aimbot",
                "algumas usam silent aim",
                "mas os de verdade",
                "usam GS",
                "e uma cadeira gamer",
                "obviamente",
            },
            {
                typesp = "1.5",
                "aviso:",
                "esse script pode causar",
                "vitórias excessivas",
                "oponentes chorando",
                "e acusações",
                "de ser hacker",
                "você foi avisado >:D",
            },
            {
                "como você chama",
                "uma pedra triste?",
                "um seixo chorão :(",
                "como você chama",
                "uma pedra feliz?",
                "um menino GSy :D",
            },
            {
                typesp = "1.5",
                "você já pensou",
                "em como eu tô falando com você",
                "através de texto",
                "numa tela",
                "num jogo",
                "sobre pedras",
                "a vida é estranha, mano",
            },
            {
                "se você leu até aqui",
                "você merece uma medalha",
                "ou uma pedra",
                "aqui vai uma pedra virtual",
                "🥔",
                "espera, isso é uma batata",
                "quase lá :p",
            },
            {
                typesp = "1.5",
                "lema do GS:",
                "seja rochoso",
                "seja áspero",
                "seja resiliente",
                "e não seja expulso",
                "pelo servidor",
                "ou anticheat",
            },
            {
                "algumas pessoas usam",
                "hacks caros",
                "nós usamos os de graça",
                "e eles funcionam melhor",
                "toma essa capitalismo",
                ":v",
            },
            {
                typesp = "2",
                "sabe o que é subestimado?",
                "o som do GS",
                "croc croc",
                "satisfatório pra caramba",
                "você não vai mudar minha opinião",
            },
            {
                "eu: 'vou fazer um script limpo'",
                "também eu:",
                "*15000+ linhas depois*",
                "o que é organização?",
                "não conheço",
                ":s",
            },
            {
                typesp = "1.5",
                "esse script contém:",
                " - 100% GS puro",
                " - mira premium",
                " - molho secreto",
                " - código questionável",
                " - lágrimas dos inimigos",
                "leia os ingredientes",
                "você não vai :P",
            },
            {
                typesp = "0.2",
                "Eu tô digitando tããããããããããããão devagar",
                "tipo super devagar",
                "pra te deixar impaciente",
            },
            {
                typesp = "5",
                "EU TÔ DIGITANDO SUPER ULTRA RÁPIDO",
                "EU TÔ DIGITANDO TÃO RÁPIDO QUE VOCÊ NEM CONSEGUE\nLER TUDO >:D",
                "MWAHAHAHAHAHAHAH",
                "EUGEAUYIQHIFU82-2;1866646649",
                "EU TAMBÉM QUEBREI MEU TECLADO",
            },
            {
                "você pode me falar seu ssn",
                "tipo......",
                "eu quero seu ssn tipo....",
                "sem motivo",
            },
            {
                typesp = "3",
                "eu não sou um robô",
                "eu sou um GS",
                "robôs são de metal",
                "GS é pedra",
                "grande diferença",
                "xeque-mate ateus",
                ":v",
            },
            {
                "você já ficou tão entediado",
                "que leu mensagens de script",
                "tipo essas?",
                "mesma coisa, tbh",
                "eu escrevi elas",
                "eu não tenho vida",
                "respeita o grind",
            },
            {
                typesp = "2",
                "você já tentou explicar",
                "o que é o GS",
                "pra alguém?",
                " 'é um script' ",
                " 'pro roblox' ",
                " 'com aimbot' ",
                "eles nunca entendem",
                "triste :(",
            },
            {
                "eu tentando decidir",
                "qual recurso adicionar depois:",
                "*gira roleta*",
                "cai em 'mais piadas'",
                "então aqui estamos",
                "de nada :D",
            },
            {
                typesp = "1.5",
                "se você curte esse script",
                "conta pra um amigo",
                "se você não curte",
                "conta pro suporte do Roblox",
                "de qualquer jeito",
                "o GS te apoia",
            },
            {
                typesp = "1.5",
                "eu amo quando",
                "o script carrega",
                "e nada quebra",
                "essa é a melhor sensação",
                "melhor que ganhar",
                "melhor que robux",
                "alegria pura",
            },
            {
                "você já",
                "deu silent aim em alguém",
                "e eles vão",
                " '??? como' ",
                "e aí você fala diferença de ping",
                "bem, eu fiz isso",
            },
            {
                "eu não tô dizendo",
                "que o GS é o melhor",
                "mas também não tô dizendo",
                "que NÃO é o melhor",
                "então é o melhor mas não o melhor-melhor",
                "tipo, faz sentido?",
            },
            {
                typesp = "1.5",
                "você já",
                "acidentalmente escreveu",
                "um recurso muito bom",
                "e não sabe como",
                "fez isso?",
                "isso é a maior parte do GS",
                "acidentes felizes",
                ":D",
            },
            {
                "eu provavelmente deveria",
                "documentar esse código",
                "mas isso é problema do eu do futuro",
                "o eu do presente quer",
                "adicionar mais piadas",
                "prioridades :v",
            },
            {
                typesp = "1.5",
                "se você me ver no jogo",
                "não, você não viu",
                "se você me ver hackando",
                "não, você não viu",
                "se você me ver ganhando",
                "isso é só habilidade",
                "habilidade GS",
                ";D",
            },
        },
        defaults = {
            minDelay = 25,
            maxDelay = 85,
            spaceExtraMin = 40,
            spaceExtraMax = 90,
            punctExtraMin = 120,
            punctExtraMax = 250,
            breakChance = 0.05,
            breakExtraMin = 100,
            breakExtraMax = 300,
            messageWaitMin = 10,
            messageWaitMax = 30,
            convoWaitMin = 15,
            convoWaitMax = 35,
            eraseWaitMin = 2,
            eraseWaitMax = 6,
            eraseDelayMin = 15,
            eraseDelayMax = 40,
            cursorBlink = 0.45,
            shuffleWaitMin = 20,
            shuffleWaitMax = 40,
        },
        popz = {
            ":0",
            ":7",
            "meu nome é GS, qual é o seu?????",
            "meu signo é uma pá :p",
            "GS é rochoso :o",
            "cascalhoooooooo",
            ":p",
            ">:3",
            "GS não é senciente, não sei do que você está falando",
            "sigmasigmaboug",
            "sou um pop-up aleatório que escolhe mensagens ao acaso 24 horas por dia, 7 dias por semana",
            "será que esse script funciona em qualquer jogo?\nsim e não",
            "esse script tem mais de 10.000 linhas... meu Deus :s",
            "a interface que ele usa é a WindUi e a notificação é a Alurt; aliás, achei isso no ballmart",
            "um script grátis?! sem chave?! e de código aberto?! que tem silent aim?! que porra é essa",
            "o script está escolhendo mensagens aleatoriamente, não precisa surtar :p",
            "desculpe usuários de xeno ou solarara, não tenho suporte para isso",
            "não não não não não, esse script não é vírus, por isso deixei em código aberto",
            "Isso é um gubby?\n\n- kreek",
            "Erro: seu roblox não é suportado",
            "ooh, computador legal você tem aí, posso ficar com ele?\n\n- Vírus Mario",
            "algo está chegando em 3 dias\n\n- verity",
            "real",
            "brabo",
            "guhby pra cá, guhby pra lá",
            "2 átomos se tocam = grande explosão",
            "dá pra fazer noclip quando seus átomos estão alinhados\nconfia",
            "não tenho Discord, aliás",
            "meu código tinha mais de 8.000 linhas, depois mais de 9.000 e agora mais de 15.000; não consigo fazer essa porra no celular D:",
            "flatgrass",
            "pesquise 'free robux' para ganhar robux grátis",
            "alt-f4 = robux grátis",
            "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.\n>\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.",
            "^_^",
            "^u^",
            "^v^",
            "half life 3 when?",
            "é um jogo chamado HELLO NEIGHBOR -HEL -HEL -HELHEL-HELLO NE-NEIGH-BOR",
            "FORTYNIGHTY LA PABAJI\npabaji\nPABAJI LA EKES BOKES SERES EKES\npabaji\nPABAJI LA BALESTHONFAIV\nbalesteshon... faiv...\nBALESTHONFAIV LA LUKITIK\nlukitik\nLUKITTIK LA HAYBAR EKES EKES EKES EKES\nhybar ekes ekes ekes ekes\nHYBAR EKES EKES EKES EKES LA GIRANDIFIFDORIGINI\ngirandififdorigini",
            "Você fez suas tarefas?\nsim senhor!\nVocê fez suas tarefas?\nsim senhor\nVocê fez suas tarefas?\nsim senhor!\nVocê fez suas tarefas?\nsim senhor\nQuando eu chegar em casa é melhor estar limpo!\nVocê fez suas tarefas?\nsim senhor!\nOH! GAROTO POR QUE VOCÊ MENTIU PRA MIM!!!\nAHHHHH",
            "Tarefa de casa?\nNão!\nTarefa de casa?\nNão!\nTarefa de casa?\nNão!\nTarefa de casa?\neu fiz na escola\nNão!\nTarefa de casa?\nNão!\nTarefa de casa?\nNão!\nPOR QUE VOCÊ TÁ REPROVANDO NAS AULAS\n AHHH D:",
            "Turkey in the Straw!",
            "du bist gut genug...\ndu bist gut genug...\ndu bist gut genug\ndu bist gut genug\n*música de fogo*",
            "本当に出口はないのか、くる、くる、くる、くる、繰り返し、繰り返し、繰り返し…\n\n\nnão vou escrever tudo isso",
            "*Intro de Stranger Things*\ndustin lucas will mike...\nARROTO",
            "robloz cadê as caras clássicas :‹",
            "Eu não vou tirar meus tênis, eu sou sneakers O'Toole",
            "Gpssickle é um gps com uma foice",
            "o script passou de 8000 linhas pra 15000 o_o",
            "só trapaceia pra passar\n\n literalmente",
            "só passa por baixo",
            "só passa por cima",
            "só scripta até lá",
            "só dá a volta\n\n- Electracy",
            "Você morre\n\n- StromBrew",
            "sonion\naprendi isso com a cultura meme, não me pergunta",
            "Eu gosto de trens",
            "bem-vindo ao McDonald's.",
            "você é meu sol, meu único sol",
            "ISSO É O SONIC COM TÊNIS CINZAS D:",
            "Átomos nunca se tocam, então isso significa que eu não roubei seu chocolate",
            "Yeah, vem pegar um pouco seu fresquinho\n\n- Scout (não da forma de provocação)",
            "sybau 🥀💔",
            "essas são referências de meme, ok",
            "água + gelo + derreter = água",
            "3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679",
            "1.61803398874989484820458683436563811772030917980576",
            "print(''*printa fofinho*'')\nerror(''*erro fofinho*'')\nwarn(''*aviso fofinho*'')",
            "GS.cc 🥀",
            "minha imaginação foi energizada",
            "VOCÊ NUNCA VÊ CHEGAAAAAANDO,\nvocê vai ver que minha mente\né rápida demais pros olhos\nVOCÊ TÁ FERRADOOOOO\nna hora que te acerta, SUA ÚLTIMA SURPRESA",
            "Gpssssssssssssssssssssssssssssssssssssssssickle",
            "sistema de posicionamento global com uma foice",
            "O dente-de-leão dourado que é o dente-de-leão dourado",
            "você pode me lembrar da proporção áurea da próxima vez",
            "vocês acham que ele parece; Steve Harvey?\n *Grita*",
            "/kill @p",
            "HBSS não significa nada lolz\ndigitei aleatoriamente...",
            "rbxm",
            "por que 'GS' sabe como areia entra no seu sapato..\no GS faz a mesma coisa mas é pra jogos",
            "pessoas mal usam a aba inferior",
            "Eu odeio renderstepped...\n(provavelmente porque eu fico usando errado)",
            "é Roblox ou roadblocks ou robloz, quem sabe",
            "''Isso funciona no Minecraft''",
            "www.GS.com ... por que esse site existe?",
            "imagina seu script sendo humilhado por um script feito totalmente no celular",
            "não existe atualização final de Terraria D:",
            "o bolo não é uma mentira... confia",
            "iS SoU uM hAcKeR?????!?!?!!!?!???!?!",
            "por que esse meme de gato babando tá em toda a minha fyp D:",
            "sinceramente mano, eu iria; [insere metalpipefalling.gif]",
            "GS vs areia vs pedra vs trecos",
            "GTA 6 quando?",
            "se disserem que você é hacker, fala 'Dif de Ping' e eles vão acreditar",
            "w wedgeey 🥺\nw junglescripts 🥺",
            "sand.cc quando?",
            "que versão é essa? bem, eu não faço ideia lol",
            "escreve scirpotjg é difícil :(",
            "Roblox pf colabl",
            "helloworld(''print'')",
            "Markiplier & Larpiplier collab quando?",
            "61? 67?\né hora das letras se divertirem\nabcdefghijklmnop\nL-M-N-O-P\nP\nP\nP\nP",
            "olá quem quer que você seja :D\neu não tenho capacidade de ver seus nomes de usuário ainda porque sou muito preguiçoso pra programar isso\nah espera, seu nome é " .. lp_info.lp_displayname .. "\n nome legal!",
            "eu quero chat do roblox sem verificação de idade",
            "esse script não é totalmente à prova de ban, então se você tomar ban NÃO culpe a gente quando estiver usando recursos arriscados :/",
            "tem tipo, sei lá quantas mensagens aleatórias eu contém lolz",
        },
        popz2 = {
            "que porra é essa",
            "nem fodendo",
            "OHHHH NEM FODENDO",
            "pop-up vai embora",
            "phonk não é só barulho?",
            "galera é um-um, h-hacker!?!?!",
            "tiki tiki",
            "Não senhor!",
            "[Meme do Eminem Jogando.png]",
            "por que eu tô escrevendo isso?",
            "sei lá, sterling?",
            "isso é um toby?",
            "clica aqui ou você é gay",
            "lolzer-ficando",
        },
        popz3 = {
            "oláoi",
            "miau :3 .... MIAU >:3",
            "Bang, Bang, Bang",
            "20-20-20 Gugu Gaga chute voador",
            "portal acima portal abaixo *pula*",
            "Gugu Gaga Ultimated Flex Works",
            "o GS roda doom?",
            "criança de ipad vs ipad, quem ganharia?",
            "ifone 90 proe max",
            "imagina eu perdendo uma ',' numa tabela grande..",
            "o GS suporta Android 5-",
            "seu dispositivo bluetooth está pronto para parear",
            "por que tem slop de ia na minha fyp do TikTok....",
            ":3 >:3 ›:3 :3",
        },
        tinf = {
            "olhar de lado bombástico",
            "ah merda, não tá bom D:",
            "67 vs 67",
            "qual é seu signo",
            "oi, eu sou um rng",
            "o que é brainfuck :s",
            "GS.cc diz seja GS",
            "peguei você",
            "shimmy ey shimmy yaaa",
            "tantas referências :o",
            "eu quero grabel :(",
            "a vida nunca fez limões...",
            "01001000 01101001",
            "quem é esse",
            "roblox não é mais robloz",
            "usuário :3",
            "água",
            "GS-MAN",
            "EU SOU SKYLER WHITE, YO",
            "minha dieta é GS",
            "6761694203602048",
            "você definitivamente tá usando delta porque sei lá",
            "me dá um dab :>",
            "quantos saves você tem",
            "Sério mesmo",
            ":3",
            "lololololooloo",
        },
        tinf2 = {
            "rbxassetid://128670966889578",
            "rbxassetid://132214308111067",
            "rbxassetid://72509803293342",
            "rbxassetid://130435138559679",
            "rbxassetid://127155823074936",
            "rbxassetid://126485931781624",
        },
        tinf3 = {
    	    "rbxassetid://72298953503422",
    	    "rbxassetid://17608357332",
           "rbxassetid://130776885039264",
           "rbxassetid://6303045144",
           "rbxassetid://101513669346450",
           "rbxassetid://17748195478",
           "rbxassetid://17517499979",
           "rbxassetid://119888856502065",
        },
        uwu = {
            "rbxassetid://72298953503422",
            "rbxassetid://17608357332",
            "rbxassetid://130776885039264",
            "rbxassetid://6303045144",
            "rbxassetid://101513669346450",
            "rbxassetid://17748195478",
            "rbxassetid://17517499979",
        },
        descs = {
            Main = {
                "por que você tá tocando meu cérebro",
                "cérebro vai brrr",
                "coisas principais",
                "as configurações principais",
                "confia em mim, eu sei o que tô fazendo",
                "configurações vão aqui!",
                "não mexe a menos que você saiba o que tá fazendo",
                "pá do GS",
                "a aba de verdade",
                "onde a mágica acontece",
                "hehe configurações vai brr",
                "você não faz ideia do que tá fazendo",
                "meee",
                "hora do cérebro grande.",
                "por favor, toma cuidado D:",
                "yolo ativa tudo",
                "principal principal principal principal",
                "configurações principais pra pessoas principais",
                "não me culpa se você quebrar coisas",
                "povo",
                "lê o texto, mano :1",
            },
            Visuals = {
                "pra gente cega",
                "oooh brilhante",
                "deixa o jogo bonito",
                "ESP vai brrrrrr",
                "vendo gente através das paredes :o",
                "visuais pra vitória",
                "coisas coloridas",
                "visão 1+",
                "paredes são só sugestão",
                "deixa eles brilharem",
                "eu consigo ver a china daqui!1!",
                "vê tudo",
                "o jogo parece diferente agora",
                "procurarificar",
                "seus olhos vão te agradecer",
                "energia de wallhack",
                "destaca os inimigos",
                "vibes arco-íris",
                "visibilidade é a chave",
                "que paredes?",
                "visão raio-x ativada",
                "visuais vão à loucura"
            },
            AntiAim = {
                "eu sou ruim na aba de esquiva",
                "mestre da esquiva 3000",
                "você não consegue me acertar >:3",
                "táticas de evasão",
                "por que eu não consigo te acertar",
                "eles não conseguem tocar nisso",
                "pew = erro",
                "anti-levar-tiro",
                "me acerta se puder",
                "não consegue tocar nisso",
                "modo matrix",
                "se teleporta atrás de você",
                "nada pessoal, criança",
                "campeão de queimada",
                "boa sorte me acertando",
                "desaparece",
                "agora você me vê, agora não vê mais",
                "confia, eu tô esquivando de verdade",
            },
            Aimbot = {
                "aimware-ando",
                "trava no alvo",
                "aba de mira sem movimento de mouse",
                "eu literalmente nunca erro",
                "precisão 1+",
                "headshot nas crianças",
                "modo cadeira gamer",
                "ímã de mira",
                "tecnicamente assistência de mira",
                "aimlabs? nunca ouvi falar",
                "mira perfeita toda vez",
                "mira na coisa",
                "precisão inc",
                "nunca mais erro em você",
                "sua mira é insana",
                "aimbot sagrado",
                "aimbot vai à loucura"
            },
            ["SilentAim (HB)"] = {
                "hitbox x aimbot x silentaim x rastreador de bala",
                "primo do Hitbox",
                "SilentAim e Hitbox tiveram um bebê",
                "ssshhh é segredo",
                "sem-mira-ful",
                "onde você tá mirando??",
                "molho secreto"
            },
            ["SilentAim (HK)"] = {
                "eu sou a opção melhor, filho",
                "bebe baseado em hook",
                "o verdadeiro silent aim",
                "tortura de raycast",
                "o melhor silentsilentaim",
                "raycast vai brrr",
                "impossível de pegar",
                "parece legítimo eu acho..",
                "aimbot 2.0",
                "aim-ster",
            },
            Hitbox = {
                "é hitbox não HURTBOX D:<",
                "tamanho importa",
                "deixa eles maiores",
                "pacote de expansão",
                "hitbox vai modo chud",
                "maior é melhor",
                "modo fácil",
                "mano, que hitbox é esse",
                "tamanhoso",
                "hitbox maior, diversão maior",
                "eles não conseguem esquivar",
                "hurtbox",
                "engordando os alvos",
                "caixa de dor grande",
                "blobão",
            },
            Reach = {
                "1+1= √4",
                "braços longos",
                "braços elásticos",
                "alcance extendido",
                "toca coisas de longe",
                "relacionamento à distância",
                "posso te tocar daqui :3",
                "modo extendo",
                "extensor de alcance",
                "VEM PRO BRASIL",
                "toca toca",
                "stretch armstrong",
                "modelo de alcance grande",
                "alcance em volta",
                "braços longos gng🥀",
                "kill aura pra espadas"
            },
            Client = {
                "eu não seguro o serverside, mano",
                "PRECISO IR RÁPIDO",
                "tô numa overdose de açúcar",
                "devido à minha cadeira gamer",
                "cliente do cliente do cliente",
            },
            Miscellaneous = {
                "merda aleatória vai!!!🔥🔥🔥🔥",
                "as sobras",
                "coisas extras",
                "coisas de mano",
                "coisas aleatórias que meu cérebro fez",
                "o resto deles",
                "trecos",
                "recursos experimentais",
                "za-silly",
                "qua",
                "jóias escondidas",
                "isca de rage aqui",
                "aleatoriedade",
                "me beija misc :3",
                "coisas extras",
            },
            BGM = {
                "múúúúúsicaaa :3",
                "tá super alto aqui",
                "deixa o g.cc mais alto",
                "[insere barulhos]",
                "bgm = música de fundo",
                "por que tem música de boss?",
                "MÚSICA DE FOGO >:D",
                "tecnicamente player de música",
                "música rbxassetid",
                "minha favorita é kwikflip",
                "meme de ouvido de angry bird",
                "bgmmmm tipo shi",
                "eu fico falando bmg",
                "o GS precisa de música de verdade",
                "bom gosto musical",
                ">:P",
                "eu quero música :3",
            },
            Info = {
                "mostra os papeizinhos",
                "o conhecimento",
                "me lê.txt",
                "homem-info",
                "MANO ME AJUDA",
                "o que é isso",
                "hora do guia",
                "ME ILUMINA",
                "*meme de macaco vs leão*",
                "eu não entendo isso 🥀😔",
                "créditos e tal",
                "dicionário",
                "como usar roadblocked",
                "se informa",
                "que porra é esse script",
                "ESPIÃO???"
            }
        },
        easterTitles = {
            "GS.ovo",
            "GS.páscoooooaaaa",
            "GS.ovástico",
            "GS.EuGostoDeOvo",
            "caçando o GS",
            "pá de páscoa",
        },
        defaultTitles = {
            "GS.cc",
            "G.cc",
            "HBSS.cc",
            "GS-est",
            "GS-er",
            "Graaaavel.cc",
            "GSly.cc",
            "GS.com",
            "Oi! Eu sou o GS.cc",
            "apreciador de GS",
            "GS.CC >:D",
            "GS.cc sagrado",
            "GSGSGS.cc",
            "Eu gosto de GS",
            "GS.trapaceatrapacea",
            "GS.sim",
            "GS.não",
            "GS.lua",
            "GS GS.CC",
        },
        aprilFools = { 
            "Areia.cc",
            "Aimware",
            "Neverlose",
            "MENU MOD RIBLOX 🔥🔥🔥",
            "você foi trollado",
            "GS é areia",
            "não é GS",
            "Terra.cc",
            "Farinha.cc",
            "Tijolo.cc 2.0",
            "tô saindo (eu acho....)",
            "PedraTriturada.cc",
            "cc.levarG",
            "grvel",
            "Enrique.cc",
            "Adrian.cc",
        },
        savesParagraph = nil,
        wasEnabledBeforeDeath = false,
        wasESPEnabledBeforeDeath = false,
        respawnLock = false,
        aimbot360LoopRunning = false,
        aimbot360LoopTask = nil,
        lastTargetUpdate = 0,
        triggerBotConnection = nil,
        sa2thing = 0,
        sa2stuff = 0.5,
        sa2this = false,
        spinbotConnection = nil,
        ViewConnection = nil,
        CameraDistance = 8,
        lowpatcherwait = 0.03,
        lowpatcher = true,
        patcherwait = 0.5,
        patcher = true,
        bhopConnection = nil,
        bhopQuickToggleUI = nil,
        lastJumpTime = 0,
        errors = true,
        Rng5stuff = nil,
        Rng3dis = {},
        orgfov = nil,
    },
    Gradow = {
        textcursor = "_",
        textcursor2 = "  ",
        uianimate = {
            connection = nil,
            basePosition = nil,
            lastPosition = Vector3.new(0, 0, 0),
            movementOffset = 0,
            smoothOffset = 0,
            pulseSpeed = 0.02,
            minThickness = 0.80,
            maxThickness = 2,
            targetRotation = 0,
            currentRotation = 0,
            windowTargetRotation = 0,
            windowCurrentRotation = 0,
            windowInitialThickness = nil,
            openButton = nil,
            windowFrame = nil,
            openStroke = nil,
            openGradient = nil,
            windowStroke = nil,
            windowGradient = nil
        },
        uicolor = {
            lightGreen = Color3.fromRGB(144, 238, 144),
            darkGray = Color3.fromRGB(40, 40, 40),
            lightGray = Color3.fromRGB(200, 200, 200),
            Red = Color3.fromRGB(255, 0, 0),
            Blue = Color3.fromRGB(175, 221, 255),
            Black = Color3.fromRGB(0, 0, 0)
        },
        windowSize = {
            mobile = UDim2.fromOffset(650, 79),
            tablet = UDim2.fromOffset(600, 80),
            pc = UDim2.fromOffset(800, 70)
        }
    }
}
]]

    local lines = {}
    for line in configCode:gmatch("[^\n]*\n?") do
        if line ~= "" then
            table.insert(lines, line)
        end
    end

    local lineHeight = 18
    local totalHeight = #lines * lineHeight
    codeScroller.CanvasSize = UDim2.fromOffset(0, totalHeight + 100)

    local yPos = 10
    for _, line in ipairs(lines) do
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.fromScale(1, 0)
        textLabel.Position = UDim2.fromOffset(10, yPos)
        textLabel.Size = UDim2.fromOffset(self.codeBackground.AbsoluteSize.X - 20, lineHeight)
        textLabel.Text = line
        textLabel.Font = Enum.Font.Code
        textLabel.TextSize = 11
        textLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
        textLabel.TextTransparency = 0.85
        textLabel.BackgroundTransparency = 1
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.TextYAlignment = Enum.TextYAlignment.Top
        textLabel.Parent = codeScroller
        yPos = yPos + lineHeight
    end

    local center = Instance.new("Frame")
    center.Size = UDim2.fromScale(0.3, 0.25)
    center.Position = UDim2.fromScale(0.5, 0.5)
    center.AnchorPoint = Vector2.new(0.5, 0.5)
    center.BackgroundTransparency = 1
    center.ZIndex = 2
    center.Parent = bg

    local title = Instance.new("TextLabel")
    title.Size = UDim2.fromScale(1, 0.35)
    title.Position = UDim2.fromScale(0.5, 0.2)
    title.AnchorPoint = Vector2.new(0.5, 0.5)
    title.Text = "inicializando"
    title.Font = Enum.Font.Code
    title.TextSize = 24
    title.TextColor3 = Color3.fromRGB(200, 200, 200)
    title.TextTransparency = 0
    title.BackgroundTransparency = 1
    title.ZIndex = 3
    title.Parent = center
    self.title = title

    local status = Instance.new("TextLabel")
    status.Size = UDim2.fromScale(1, 0.3)
    status.Position = UDim2.fromScale(0.5, 0.55)
    status.AnchorPoint = Vector2.new(0.5, 0.5)
    status.Text = "buscando arquivos de recursos aleatórios..."
    status.Font = Enum.Font.Code
    status.TextSize = 14
    status.TextColor3 = Color3.fromRGB(150, 150, 150)
    status.TextTransparency = 0
    status.BackgroundTransparency = 1
    status.ZIndex = 3
    status.Parent = center
    self.status = status

    local dots = Instance.new("TextLabel")
    dots.Size = UDim2.fromScale(1, 0.3)
    dots.Position = UDim2.fromScale(0.5, 0.8)
    dots.AnchorPoint = Vector2.new(0.5, 0.5)
    dots.Text = ""
    dots.Font = Enum.Font.Code
    dots.TextSize = 18
    dots.TextColor3 = Color3.fromRGB(200, 200, 200)
    dots.TextTransparency = 0
    dots.BackgroundTransparency = 1
    dots.ZIndex = 3
    dots.Parent = center
    self.dots = dots

    self:startAnimations()
    return self
end

function InitGui:startAnimations()
    self.dotTask = task.spawn(function()
        while self.gui and self.gui.Parent do
            self.dotCount = (self.dotCount % 3) + 1
            self.dots.Text = string.rep(".", self.dotCount)
            task.wait(0.35)
        end
    end)

    self.statusTask = task.spawn(function()
        local lastChange = 0
        while self.gui and self.gui.Parent do
            local elapsed = tick() - lastChange
            if elapsed > math.random(8, 18) / 10 then
                local newMsg = self.statusMessages[math.random(1, #self.statusMessages)]
                local tween = game:GetService("TweenService"):Create(self.status, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    TextTransparency = 1
                })
                tween:Play()
                tween.Completed:Wait()
                self.status.Text = newMsg
                local tween2 = game:GetService("TweenService"):Create(self.status, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    TextTransparency = 0
                })
                tween2:Play()
                lastChange = tick()
            end
            task.wait(0.1)
        end
    end)

    self.scrollTask = task.spawn(function()
        if not self.codeScroller then return end
        local canvasHeight = self.codeScroller.CanvasSize.Y.Offset
        local startPos = 0
        local speed = 500
        
        while self.gui and self.gui.Parent do
            startPos = startPos + speed * 0.03
            if startPos > canvasHeight - self.codeScroller.AbsoluteSize.Y then
                startPos = 0
            end
            self.codeScroller.CanvasPosition = Vector2.new(0, startPos)
            task.wait(0.03)
        end
    end)
end

function InitGui:destroy()
    if self.gui and self.gui.Parent then
        if self.dotTask then
            task.cancel(self.dotTask)
            self.dotTask = nil
        end
        if self.statusTask then
            task.cancel(self.statusTask)
            self.statusTask = nil
        end
        if self.scrollTask then
            task.cancel(self.scrollTask)
            self.scrollTask = nil
        end
        local slideOutTask = task.spawn(function()
            if not self.codeScroller then return end
            
            local canvasHeight = self.codeScroller.CanvasSize.Y.Offset
            local startPos = self.codeScroller.CanvasPosition.Y or 0
            local speed = 500
            local slideSpeed = 800
            local targetX = -(self.codeBackground.AbsoluteSize.X + 100)
            while self.codeScroller and self.codeScroller.Parent do
                startPos = startPos + speed * 0.03
                if startPos > canvasHeight - self.codeScroller.AbsoluteSize.Y then
                    startPos = 0
                end
                self.codeScroller.CanvasPosition = Vector2.new(0, startPos)
                
                local currentPos = self.codeBackground.Position
                if currentPos.X.Offset > targetX then
                    local newX = currentPos.X.Offset - slideSpeed * 0.03
                    self.codeBackground.Position = UDim2.fromOffset(newX, 0)
                else
                    break 
                end
                
                task.wait(0.03)
            end
        end)
        local fadeOut = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        if self.bg then
            game:GetService("TweenService"):Create(self.bg, fadeOut, {BackgroundTransparency = 1}):Play()
        end
        if self.title then
            game:GetService("TweenService"):Create(self.title, fadeOut, {TextTransparency = 1}):Play()
        end
        if self.status then
            game:GetService("TweenService"):Create(self.status, fadeOut, {TextTransparency = 1}):Play()
        end
        if self.dots then
            game:GetService("TweenService"):Create(self.dots, fadeOut, {TextTransparency = 1}):Play()
        end
        task.wait(0.7)
        if slideOutTask then
            task.cancel(slideOutTask)
        end
        self.gui:Destroy()
        self.gui = nil
        self.bg = nil
        self.title = nil
        self.status = nil
        self.dots = nil
        self.codeBackground = nil
        self.codeScroller = nil
    end
end
local initGui = InitGui.new():create()
getgenv().destroyInitGui = function()
    if initGui then
        initGui:destroy()
        initGui = nil
    end
end
getgenv().InitGui_ = initGui
