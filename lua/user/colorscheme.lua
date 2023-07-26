vim.g.tokyonight_style = "night"
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.g.gruvbox_contrast_dark = "hard"

local colorscheme = "kanagawa"
-- setup must be called before loading
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    return
end

local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
    return
end

local palette_colors = {
    -- Bg Shades
    sumiInk0      = "#16161D",
    sumiInk1b     = "#181820",
    sumiInk1c     = "#1a1a22",
    sumiInk1      = "#1F1F1F",
    sumiInk2      = "#2A2A37",
    sumiInk3      = "#363646",
    sumiInk4      = "#54546D",

    -- Popup and Floats
    waveBlue1     = "#223249",
    waveBlue2     = "#2D4F67",

    -- Diff and Git
    winterGreen   = "#2B3328",
    winterYellow  = "#49443C",
    winterRed     = "#43242B",
    winterBlue    = "#252535",
    autumnGreen   = "#76946A",
    autumnRed     = "#C34043",
    autumnYellow  = "#DCA561",

    -- Diag
    samuraiRed    = "#E82424",
    roninYellow   = "#FF9E3B",
    waveAqua1     = "#6A9589",
    dragonBlue    = "#658594",

    -- Fg and Comments
    oldWhite      = "#C8C093",
    fujiWhite     = "#DCD7BA",
    fujiGray      = "#727169",
    springViolet1 = "#938AA9",

    oniViolet     = "#957FB8",
    crystalBlue   = "#7E9CD8",
    springViolet2 = "#9CABCA",
    springBlue    = "#7FB4CA",
    lightBlue     = "#A3D4D5", -- unused yet
    waveAqua2     = "#7AA89F", -- improve lightness: desaturated greenish Aqua

    -- waveAqua2  = "#68AD99",
    -- waveAqua4  = "#7AA880",
    -- waveAqua5  = "#6CAF95",
    -- waveAqua3  = "#68AD99",

    springGreen   = "#98BB6C",
    boatYellow1   = "#938056",
    boatYellow2   = "#C0A36E",
    carpYellow    = "#E6C384",

    sakuraPink    = "#D27E99",
    waveRed       = "#E46876",
    peachRed      = "#FF5D62",
    surimiOrange  = "#FFA066",
    katanaGray    = "#717C7C",
}

kanagawa.setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,    -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = false,     -- do not set background color
    dimInactive = false,     -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,    -- adjust window separators highlight for laststatus=3
    terminalColors = true,   -- define vim.g.terminal_color_{0,17}
    colors = palette_colors,
    overrides = {},
    --[[ theme = "default"           -- Load "default" theme or the experimental "light" theme ]]
})
