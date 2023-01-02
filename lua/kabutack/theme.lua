
-- import the utility file
local blend = require('kabutack.utils').blend

-- local variable
local M = {}

------------ I don't what will be took in as config variable for now, but for sure it is the main variable ------------
-- config is a variable, that passed by init.lua
function M.get(config)
    local p = require 'kabutack.palette'

    -- theme varaible
    local theme = {}
    -- use config variable here
    local groups = config.groups or {}
    -- style variable
    local styles = {
        italic = (config.disable_italics and p.none) or 'italic',
        vert_split = (config.bold_vert_split and groups.border) or p.none,
        background = (config.disable_background and p.none) or groups.background,
        float_background = (config.disable_float_background and p.none) or groups.panel,
    }
    styles.nc_background = (config.dim_nc_background and not config.disable_background and groups.panel)
        or styles.background



    -- general setting of how your neovim will look

    theme = {
        ------------------------------------------------------------------------
        -- if you set colorcolumn=80 or in option.lua
        -- a ruler placed vertically at the back of the line you are working on
        ColorColumn = { bg = p.white },
        -- no idea
        Conceal = { bg = p.none },
        -- no idea
        CurSearch = { link = 'IncSearch' },
        -- Cursor = {},
        CursorColumn = { bg = p.bg },
        -- CursorIM = {},
        CursorLine = { bg = p.bg },
        CursorLineNr = { fg = p.text },
        ------------------------------------------------------------------------
        -- no idea for this section
        DarkenedPanel = { bg = groups.panel },
        DarkenedStatusline = { bg = groups.panel },
        DiffAdd = { bg = blend(groups.git_add, groups.background, 0.5) },
        DiffChange = { bg = p.blue },
        DiffDelete = { bg = blend(groups.git_delete, groups.background, 0.5) },
        DiffText = { bg = blend(groups.git_text, groups.background, 0.5) },
        diffAdded = { link = 'DiffAdd' },
        diffChanged = { link = 'DiffChange' },
        diffRemoved = { link = 'DiffDelete' },
        ------------------------------------------------------------------------
        -- no idea
        Directory = { fg = p.blue, bg = p.none },
        -- EndOfBuffer = {},
        ErrorMsg = { fg = p.magenta, style = 'bold' },
        -- no idea
        FloatBorder = { fg = groups.border },
        -- no idea
        FloatTitle = { fg = p.blue },
        -- no idea
        FoldColumn = { fg = p.blue },
        -- no idea
        Folded = { fg = p.text, bg = groups.panel },
        -- no idea
        IncSearch = { fg = p.bg, bg = p.blue },
        ------------------------------------------------------------------------
        -- no idea
        ModeMsg = { fg = p.blue },
        -- no idea
        MoreMsg = { fg = p.blue },
        ------------------------------------------------------------------------
        -- no idea
        NonText = { fg = p.blue },
        -- no idea
        Normal = { fg = p.text, bg = styles.bg },
        -- no idea
        NormalFloat = { fg = p.text, bg = styles.float_background },
        -- no idea
        NormalNC = { fg = p.text, bg = styles.nc_background },
        ------------------------------------------------------------------------
        -- no idea
        NvimInternalError = { fg = '#ffffff', bg = p.magenta },
        ------------------------------------------------------------------------
        -- no idea
        Pmenu = { fg = p.blue, bg = styles.float_background },
        -- no idea
        PmenuSbar = { bg = p.blue },
        -- no idea
        PmenuSel = { fg = p.text, bg = p.bg },
        -- no idea
        PmenuThumb = { bg = p.blue },
        ------------------------------------------------------------------------
        -- no idea
        Question = { fg = p.yellow },
        -- QuickFixLine = {},
        -- RedrawDebugNormal = {}
        -- no idea
        RedrawDebugClear = { fg = '#ffffff', bg = p.yellow },
        -- no idea
        RedrawDebugComposed = { fg = '#ffffff', bg = p.bright_black },
        -- no idea
        RedrawDebugRecompose = { fg = '#ffffff', bg = p.magenta },
        ------------------------------------------------------------------------
        -- no idea
        Search = { fg = p.white, bg = p.blue },
        ------------------------------------------------------------------------
        -- no idea
        SpecialKey = { fg = p.bright_black },
        -- no idea
        SpellBad = { sp = p.magenta, style = 'undercurl' },
        -- no idea
        SpellCap = { sp = p.blue, style = 'undercurl' },
        -- no idea
        SpellLocal = { sp = p.yellow, style = 'undercurl' },
        -- no idea
        SpellRare = { sp = p.blue, style = 'undercurl' },
        ------------------------------------------------------------------------
        -- no idea
        StatusLine = { fg = p.blue, bg = styles.float_background },
        -- no idea
        StatusLineNC = { fg = p.blue3, bg = styles.background },
        -- no idea
        StatusLineTerm = { link = 'StatusLine' },
        -- no idea
        StatusLineTermNC = { link = 'StatusLineNC' },
        ------------------------------------------------------------------------
        -- no idea
        TabLine = { fg = p.blue, bg = styles.float_background },
        -- no idea
        TabLineFill = { bg = styles.float_background },
        -- no idea
        TabLineSel = { fg = p.text, bg = p.background },
        -- no idea
        Title = { fg = p.text },
        ------------------------------------------------------------------------
        -- no idea
        VertSplit = { fg = groups.border, bg = styles.vert_split },
        -- no idea
        ------------------------------------------------------------------------
        -- VisualNOS = {},
        -- no idea
        WarningMsg = { fg = p.yellow },
        -- no idea
        Whitespace = { fg = p.blue },
        -- no idea
        WildMenu = { link = 'IncSearch' },


        -- ===================================================================== known ==========================================================================
        LineNr = { fg = p.bg },                                -- color of column number on the left
        MatchParen = { bg = '#ffffff', fg = p.black },              -- color of matching parenthesis/bracket
        SignColumn = { fg = '#000000', bg = '#ffffff' },            -- space on the left of left column number
        Visual = { fg = p.text, bg = p.green },                   -- selected color visual mode


        -- default color in code file
        Constant = { fg = p.blue },                                 -- (preferred) any constant
        String = { fg = p.bright_yellow },                          -- a string constant: "this is a string"
        Character = { fg = p.yellow },                              -- a character constant: 'c', '\n'
        Number = { fg = p.white },                                  -- a number constant: 234, 0xff
        Boolean = { fg = p.green2 },                                -- a boolean constant: TRUE, false
        Float = { fg = p.white },                                   -- a floating point constant: 2.3e10
        Identifier = { fg = p.cyan },                               -- (preferred) any variable name
        Function = { fg = p.blue },                                 -- function name (also: methods for classes)

        Statement = { fg = p.text },                                -- (preferred) any statement
        Conditional = { fg = p.magenta },                           -- if, then, else, endif, switch, etc.
        Repeat = { fg = p.magenta },                                -- for, do, while, etc.
        Label = { fg = p.text },                                    -- case, default, etc.
        Operator = { fg = p.blue },                                 -- "sizeof", "+", "*", etc.
        Keyword = { fg = p.blue },                                  -- any other keyword
        Exception = { fg = p.magenta },                             -- try, catch, throw

        PreProc = { fg = p.text },                                  -- (preferred) generic Preprocessor
        Include = { fg = p.bright_green },                          -- preprocessor #include
        -- Define        = { },                                       -- preprocessor #define
        -- Macro         = { },                                       -- same as Define
        -- PreCondit     = { },                                       -- preprocessor #if, #else, #endif, etc.
        Type = { fg = p.bright_red },                               -- (preferred) int, long, char, etc.
        --[[ Structure = { fg = p.blueGray1 },                        -- struct, union, enum, etc. ]]
        -- StorageClass  = { },                                       -- static, register, volatile, etc.
        -- Typedef = { fg = p.blueGray1 },                            -- A typedef
        Special = { fg = p.red },                                   -- (preferred) any special symbol
        -- SpecialChar   = { },                                     -- special character in a constant
        Tag = { fg = p.text },                                      -- you can use CTRL-] on this
        Delimiter = { fg = p.blue },                                -- character that needs attention
        SpecialComment = { fg = p.blue },                           -- special things inside a comment
        -- Debug         = { },                                       -- debugging statements
        Comment = { fg = p.comment },                               -- (preferred) any special symbol

        Underlined = { style = 'underline' },                       -- (preferred) text that stands out, HTML links
        Bold = { style = 'bold' },
        Italic = { style = 'italic' },

        -- ("Ignore", below, may be invisible...)
        -- Ignore = { },                                              -- (preferred) left blank, hidden  |hl-Ignore|

        Error = { fg = p.red },                                     -- (preferred) any erroneous construct
        Todo = { bg = p.yellow, fg = p.bg },                        -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        qfLineNr = { fg = p.blue },
        qfFileName = { fg = p.blue },

        htmlH1 = { fg = p.yellow, style = 'bold' },
        htmlH2 = { fg = p.bright_yellow2, style = 'bold' },

        -- mkdHeading = { fg = c.orange, style = "bold" },
        -- mkdCode = { bg = c.terminal_black, fg = c.fg },
        mkdCodeDelimiter = { bg = p.bg, fg = p.text },
        mkdCodeStart = { fg = p.bright_black, style = 'bold' },
        mkdCodeEnd = { fg = p.bright_black, style = 'bold' },
        mkdLink = { fg = p.blue, style = 'underline' },

        markdownHeadingDelimiter = { fg = p.blue, style = 'bold' },
        markdownCode = { fg = p.yellow },
        markdownCodeBlock = { fg = p.bright_yellow },
        markdownH1 = { fg = p.blue, style = 'bold' },
        markdownH2 = { fg = p.blue, style = 'bold' },
        markdownH3 = { fg = p.blue, style = 'bold' },
        markdownH4 = { fg = p.blue, style = 'bold' },
        markdownLinkText = { fg = p.blue, style = 'underline' },

        debugPC = { bg = p.background },                              -- used for highlighting the current line in terminal-debug
        debugBreakpoint = { bg = p.background, fg = p.magenta },      -- used for breakpoint colors in terminal-debug
        DiagnosticError = { fg = groups.red },
        DiagnosticHint = { fg = groups.green },
        DiagnosticInfo = { fg = groups.blue },
        DiagnosticWarn = { fg = groups.bright_red },
        DiagnosticDefaultError = { fg = groups.red },
        DiagnosticDefaultHint = { fg = groups.green },
        DiagnosticDefaultInfo = { fg = groups.blue },
        DiagnosticDefaultWarn = { fg = groups.bright_red },
        DiagnosticFloatingError = { fg = groups.red },
        DiagnosticFloatingHint = { fg = groups.green },
        DiagnosticFloatingInfo = { fg = groups.blue },
        DiagnosticFloatingWarn = { fg = groups.bright_red },
        DiagnosticSignError = { fg = groups.red },
        DiagnosticSignHint = { fg = groups.green },
        DiagnosticSignInfo = { fg = groups.blue },
        DiagnosticSignWarn = { fg = groups.bright_red },
        DiagnosticStatusLineError = { fg = groups.red, bg = groups.panel },
        DiagnosticStatusLineHint = { fg = groups.green, bg = groups.panel },
        DiagnosticStatusLineInfo = { fg = groups.blue, bg = groups.panel },
        DiagnosticStatusLineWarn = { fg = groups.bright_red, bg = groups.panel },
        DiagnosticUnderlineError = { sp = groups.red, style = 'undercurl' },
        DiagnosticUnderlineHint = { sp = groups.green, style = 'undercurl' },
        DiagnosticUnderlineInfo = { sp = groups.blue, style = 'undercurl' },
        DiagnosticUnderlineWarn = { sp = groups.bright_red, style = 'undercurl' },
        DiagnosticVirtualTextError = { fg = groups.red },
        DiagnosticVirtualTextHint = { fg = groups.green },
        DiagnosticVirtualTextInfo = { fg = groups.blue },
        DiagnosticVirtualTextWarn = { fg = groups.bright_red },


        -- Treesitter
        --  fg = "#D8DEE9"
        ["@include"] = { fg = "#A1EFD3" },
        ["@string"] = { fg = "#FFE6B3" },
        ["@string.regex"] = { fg = "#FFE6B3" },
        ["@string.escape"] = { fg = "#FFE6B3" },
        ["@keyword"] = { fg = "#A37ACC" },                                          -- For keywords that don't fall in previous categories
        ["@keyword.function"] = { fg = "#A37ACC" },                                 -- const
        ["@keyword.operator"] = { fg = "#A37ACC" },                                 -- new / delete
        ["@keyword.return"] = { fg = "#A37ACC" },
        ["@namespace"] = { fg = "#DBDEE9", underline = true },
        ["@type"] = { fg = "#ff757f" },
        ["@type.builtin"] = { fg = "#ff757f" },                                     -- ?
        ["@type.definition"] = { fg = "#ff757f" },                                  -- Typedef
        ["@type.qualifier"] = { fg = "#ff757f" },
        ["@parameter"] = { fg = "#DBDEE9" },
        ["@parameter.reference"] = { fg = "#DBDEE9" },
        ["@comment"] = { fg = "#3E3859", italic = true },
        ["@repeat"] = { fg = "#A37ACC" },
        ["@conditional"] = { fg = "#A37ACC" },
        ["@function"] = { fg = "#7aa2f7" },
        ["@function.builtin"] = { fg = "#7aa2f7" },
        ["@function.call"] = { fg = "#7aa2f7" },
        ["@function.macro"] = { fg = "#7aa2f7" },
        ["@operator"] = { fg = "#7aa2f7" },
        ["@punctuation.delimiter"] = { fg = "#DBDEE9" },                            -- semi-colon or dots
        ["@punctuation.bracket"] = { fg = "#DBDEE9" },                              -- brackets and parens
        ["@punctuation.special"] = { fg = "#7aa2f7" },                              -- special punctutation
        ["@variable"] = { fg = "#DBDEE9" },                                         -- user defined variable
        ["@variable.builtin"] = { fg = "#ff757f" },                                 -- variables defined by the languages, like `this` or `self`
        ["@boolean"] = { fg = "#4fd6be" },
        ["@number"] = { fg = "#DBDEE9" },                                           -- backup: #4fd6be | #62D196
        ["@float"] = { fg = "#DBDEE9" },
        ["@constructor"] = { fg = "#91DDFF" },
        ["@property"] = { fg = "#4fd6be" },                                         -- private data member
        ["@constant"] = { fg = "#7aa2f7" },
        ["@constant.builtin"] = { fg = "#7aa2f7" },
        ["@constant.macro"] = { fg = "#7aa2f7" },
        ["@exception"] = { fg = "#ff757f" },
        ["@tag"] = { fg = "#A37ACC" },                                              -- html ?


        ['field'] = { fg = p.text },
        ['@label'] = { fg = p.blue3 },
        ['@method'] = { fg = p.teal1 },
        ['@property'] = { fg = p.blue2 },
        ['@tag.delimiter'] = { fg = p.text },
        ['@tag.attribute'] = { fg = p.blue3, style = styles.italic },
        ['@text'] = { fg = p.text },
        ['@title'] = { fg = groups.headings.h1, style = 'bold' },

        --[[ -- tsx/jsx ]]
        --[[ typescriptVariable = { fg = p.blue2 }, ]]
        --[[ typescriptExport = { fg = p.teal1 }, ]]
        --[[ typescriptDefault = { fg = p.teal1 }, ]]
        --[[ typescriptConstraint = { fg = p.teal1 }, ]]
        --[[ typescriptBlock = { fg = p.text }, ]]
        --[[ typescriptIdentifierName = { fg = p.blueGray2 }, ]]
        --[[ typescriptTSInclude = { fg = p.teal1 }, ]]
        --[[ typescriptCastKeyword = { fg = p.blueGray2 }, ]]
        --[[ typescriptEnum = { fg = p.blue4 }, ]]
        --[[ typescriptTypeCast = { fg = p.blueGray2 }, ]]
        --[[ typescriptParenExp = { fg = p.blueGray2 }, ]]
        --[[ typescriptObjectType = { fg = p.blueGray1 }, ]]
        --[[]]
        --[[ -- lua ]]
        --[[ luaTSConstructor = { fg = p.blueGray1 }, ]]
        --[[]]
        --[[ -- css ]]
        --[[ cssTSFunction = { fg = p.blueGray1 }, ]]
        --[[ cssTSProperty = { fg = p.blue2 }, ]]
        --[[ cssTSType = { fg = p.teal1 }, ]]
        --[[ cssTSKeyword = { fg = p.blueGray1 }, ]]
        --[[ cssClassName = { fg = p.teal2, style = styles.italic }, ]]
        --[[ cssPseudoClass = { fg = p.blue3, style = styles.italic }, ]]
        --[[ cssDefinition = { fg = p.blue2 }, ]]
        --[[ cssTSError = { link = 'cssClassName' }, ]]
        --[[]]
        --[[ -- vim.lsp.buf.document_highlight() ]]
        --[[ LspReferenceText = { bg = p.blue2 }, ]]
        --[[ LspReferenceRead = { bg = p.blue2 }, ]]
        --[[ LspReferenceWrite = { bg = p.blue2 }, ]]
        --[[]]
        --[[ -- lsp-highlight-codelens ]]
        --[[ LspCodeLens = { fg = p.blueGray1 }, -- virtual text of code lens ]]
        --[[ LspCodeLensSeparator = { fg = p.blueGray3 }, -- separator between two or more code lens ]]
        --[[]]
        --[[ -- nvim-ts-rainbow ]]
        --[[ rainbowcol1 = { fg = p.blue1 }, ]]
        --[[ rainbowcol2 = { fg = p.teal1 }, ]]
        --[[ rainbowcol3 = { fg = p.yellow }, ]]
        --[[ rainbowcol4 = { fg = p.blue2 }, ]]
        --[[ rainbowcol5 = { fg = p.teal2 }, ]]
        --[[ rainbowcol6 = { fg = p.pink3 }, ]]
        --[[ rainbowcol7 = { fg = p.blue3 }, ]]
        --[[]]
        --[[ -- romgrk/barbar.nvim ]]
        --[[ BufferCurrent = { fg = p.text, bg = p.background2 }, ]]
        --[[ BufferCurrentIndex = { fg = p.text, bg = p.background2 }, ]]
        --[[ BufferCurrentMod = { fg = p.teal1, bg = p.background2 }, ]]
        --[[ BufferCurrentSign = { fg = p.blueGray1, bg = p.background2 }, ]]
        --[[ BufferCurrentTarget = { fg = p.yellow, bg = p.background2 }, ]]
        --[[ BufferInactive = { fg = p.blueGray1 }, ]]
        --[[ BufferInactiveIndex = { fg = p.blueGray1 }, ]]
        --[[ BufferInactiveMod = { fg = p.teal1 }, ]]
        --[[ BufferInactiveSign = { fg = p.blueGray2 }, ]]
        --[[ BufferInactiveTarget = { fg = p.yellow }, ]]
        --[[ BufferTabpageFill = { fg = groups.background, bg = groups.background }, ]]
        --[[ BufferVisible = { fg = p.blueGray1 }, ]]
        --[[ BufferVisibleIndex = { fg = p.blueGray1 }, ]]
        --[[ BufferVisibleMod = { fg = p.teal1 }, ]]
        --[[ BufferVisibleSign = { fg = p.blueGray2 }, ]]
        --[[ BufferVisibleTarget = { fg = p.yellow }, ]]
        --[[]]
        --[[ -- lewis6991/gitsigns.nvim ]]
        --[[ GitSignsAdd = { fg = groups.git_add }, ]]
        --[[ GitSignsChange = { fg = groups.git_change }, ]]
        --[[ GitSignsDelete = { fg = groups.git_delete }, ]]
        --[[ SignAdd = { link = 'GitSignsAdd' }, ]]
        --[[ SignChange = { link = 'GitSignsChange' }, ]]
        --[[ SignDelete = { link = 'GitSignsDelete' }, ]]
        --[[]]
        --[[ -- mvllow/modes.nvim ]]
        --[[ ModesCopy = { bg = p.yellow }, ]]
        --[[ ModesDelete = { bg = p.magenta }, ]]
        --[[ ModesInsert = { bg = p.bright_black }, ]]
        --[[ ModesVisual = { bg = p.yellow }, ]]
        --[[]]
        --[[ -- kyazdani42/nvim-tree.lua ]]
        --[[ NvimTreeEmptyFolderName = { fg = p.blueGray3 }, ]]
        --[[ NvimTreeFileDeleted = { fg = p.pink3 }, ]]
        --[[ NvimTreeFileDirty = { fg = p.blue4 }, ]]
        --[[ NvimTreeFileMerge = { fg = p.blue2 }, ]]
        --[[ NvimTreeFileNew = { fg = p.teal1 }, ]]
        --[[ NvimTreeFileRenamed = { fg = p.blueGray3 }, ]]
        --[[ NvimTreeFileStaged = { fg = p.blue1 }, ]]
        --[[ NvimTreeFolderIcon = { fg = p.blue3 }, ]]
        --[[ NvimTreeFolderName = { fg = p.blue3 }, ]]
        --[[ NvimTreeGitDeleted = { fg = groups.git_delete }, ]]
        --[[ NvimTreeGitDirty = { fg = groups.git_dirty }, ]]
        --[[ NvimTreeGitIgnored = { fg = groups.git_ignore }, ]]
        --[[ NvimTreeGitMerge = { fg = groups.git_merge }, ]]
        --[[ NvimTreeGitNew = { fg = groups.git_add }, ]]
        --[[ NvimTreeGitRenamed = { fg = groups.git_rename }, ]]
        --[[ NvimTreeGitStaged = { fg = groups.git_stage }, ]]
        --[[ NvimTreeImageFile = { fg = p.text }, ]]
        --[[ NvimTreeNormal = { fg = p.text }, ]]
        --[[ NvimTreeOpenedFile = { fg = p.text, bg = p.background1 }, ]]
        --[[ NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' }, ]]
        --[[ NvimTreeRootFolder = { fg = p.teal1 }, ]]
        --[[ NvimTreeSpecialFile = { link = 'NvimTreeNormal' }, ]]
        --[[ NvimTreeWindowPicker = { fg = groups.bg, bg = p.blueGray1 }, ]]
        --[[]]
        --[[ -- folke/which-key.nvim ]]
        --[[ WhichKey = { fg = p.text }, ]]
        --[[ WhichKeyGroup = { fg = p.text }, ]]
        --[[ WhichKeySeparator = { fg = p.text }, ]]
        --[[ WhichKeyDesc = { fg = p.text }, ]]
        --[[ WhichKeyFloat = { bg = groups.panel }, ]]
        --[[ WhichKeyValue = { fg = p.text }, ]]
        --[[]]
        --[[ -- luka-reineke/indent-blankline.nvim ]]
        --[[ IndentBlanklineChar = { fg = p.background1 }, ]]
        --[[ IndentBlanklineContextChar = { fg = p.yellow, gui = 'nocombine' }, ]]
        --[[ IndentBlanklineContextStart = { fg = p.yellow, gui = 'underline' }, ]]
        --[[ IndentBlanklineSpaceChar = { link = 'Whitespace' }, ]]
        --[[ IndentBlanklineSpaceCharBlankline = { link = 'Whitespace' }, ]]
        --[[]]
        --[[ -- hrsh7th/nvim-cmp ]]
        --[[ CmpItemAbbr = { fg = p.blueGray2 }, ]]
        --[[ CmpItemAbbrDeprecated = { fg = p.pink3, style = 'strikethrough' }, ]]
        --[[ CmpItemAbbrMatch = { fg = p.text, style = 'bold' }, ]]
        --[[ CmpItemAbbrMatchFuzzy = { fg = p.teal1, style = 'bold' }, ]]
        --[[ CmpItemKind = { fg = p.blue3 }, ]]
        --[[ CmpItemKindClass = { fg = p.yellow }, ]]
        --[[ CmpItemKindFunction = { fg = p.blue1 }, ]]
        --[[ CmpItemKindInterface = { fg = p.blue2 }, ]]
        --[[ CmpItemKindMethod = { fg = p.pink3 }, ]]
        --[[ CmpItemKindSnippet = { fg = p.blueGray1 }, ]]
        --[[ CmpItemKindVariable = { fg = p.teal1 }, ]]
        --[[]]
        --[[ -- ray-x/lsp_signature.nvim ]]
        --[[ LspSignatureActiveParameter = { bg = p.blueGray1 }, ]]
        --[[]]
        --[[ -- rlane/pounce.nvim ]]
        --[[ PounceAccept = { fg = p.pink3, bg = p.text }, ]]
        --[[ PounceAcceptBest = { fg = p.text, bg = p.text }, ]]
        --[[ PounceGap = { link = 'Search' }, ]]
        --[[ PounceMatch = { link = 'Search' }, ]]
        --[[]]
        --[[ -- nvim-telescope/telescope.nvim ]]
        --[[ TelescopeBorder = { fg = groups.border }, ]]
        --[[ TelescopeMatching = { fg = p.teal1 }, ]]
        --[[ TelescopeNormal = { fg = p.text }, ]]
        --[[ TelescopePromptNormal = { fg = p.text }, ]]
        --[[ TelescopePromptPrefix = { fg = p.blueGray1 }, ]]
        --[[ TelescopeSelection = { fg = p.text, bg = p.blueGray1 }, ]]
        --[[ TelescopeSelectionCaret = { fg = p.pink2, bg = p.blueGray1 }, ]]
        --[[ TelescopeTitle = { fg = p.blueGray2 }, ]]
        --[[]]
        --[[ -- phaazon/hop.nvim ]]
        --[[ HopNextKey = { fg = p.blue1 }, ]]
        --[[ HopNextKey1 = { fg = p.teal1 }, ]]
        --[[ HopNextKey2 = { fg = p.teal2 }, ]]
        --[[ HopUnmatched = { fg = p.blueGray3 }, ]]
        --[[ HopCursor = { fg = p.blue3 }, ]]
        --[[]]
        --[[ -- rcarriga/nvim-notify ]]
        --[[ NotifyINFOBorder = { fg = p.teal1 }, ]]
        --[[ NotifyINFOTitle = { link = 'NotifyINFOBorder' }, ]]
        --[[ NotifyINFOIcon = { link = 'NotifyINFOBorder' }, ]]
        --[[ NotifyWARNBorder = { fg = p.yellow }, ]]
        --[[ NotifyWARNTitle = { link = 'NotifyWARNBorder' }, ]]
        --[[ NotifyWARNIcon = { link = 'NotifyWARNBorder' }, ]]
        --[[ NotifyDEBUGBorder = { fg = p.blue1 }, ]]
        --[[ NotifyDEBUGTitle = { link = 'NotifyDEBUGBorder' }, ]]
        --[[ NotifyDEBUGIcon = { link = 'NotifyDEBUGBorder' }, ]]
        --[[ NotifyTRACEBorder = { fg = p.blue1 }, ]]
        --[[ NotifyTRACETitle = { link = 'NotifyTRACEBorder' }, ]]
        --[[ NotifyTRACEIcon = { link = 'NotifyTRACEBorder' }, ]]
        --[[ NotifyERRORBorder = { fg = p.pink3 }, ]]
        --[[ NotifyERRORTitle = { link = 'NotifyERRORBorder' }, ]]
        --[[ NotifyERRORIcon = { link = 'NotifyERRORBorder' }, ]]


  }


  vim.g.terminal_color_0 = p.black -- black
  vim.g.terminal_color_8 = p.bright_black -- bright black
  vim.g.terminal_color_1 = p.red -- red
  vim.g.terminal_color_9 = p.bright_red -- bright red
  vim.g.terminal_color_2 = p.green -- green
  vim.g.terminal_color_10 = p.bright_green -- bright green
  vim.g.terminal_color_3 = p.yellow -- yellow
  vim.g.terminal_color_11 = p.bright_yellow -- bright yellow
  vim.g.terminal_color_4 = p.blue -- blue
  vim.g.terminal_color_12 = p.bright_blue -- bright blue
  vim.g.terminal_color_5 = p.magenta -- magenta
  vim.g.terminal_color_13 = p.bright_mangeta -- bright magenta
  vim.g.terminal_color_6 = p.cyan -- cyan
  vim.g.terminal_color_14 = p.bright_cyan -- bright cyan
  vim.g.terminal_color_7 = p.white -- white
  vim.g.terminal_color_15 = p.bright_white -- bright white

  return theme
end

return M
