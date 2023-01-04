
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
        DiffAdd = { bg = blend(groups.git_add, groups.background, 1) },
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
        StatusLineNC = { fg = p.blue, bg = styles.background },
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


        -- ========================================================= known ===================================================================
        LineNr = { fg = p.comment },                                -- color of column number on the left
        MatchParen = { bg = p.none, fg = p.bright_red },            -- color of matching parenthesis/bracket
        SignColumn = { fg = '#000000', bg = p.black },              -- color of the space on the left of left column number
        Visual = { fg = p.black, bg = p.green4 },                   -- selected color visual mode
        Search = { fg = p.black, bg = p.green3 },                   -- / search inside neovim
        NonText = { fg = p.bg },                                    -- color of wavy line on the left of the neovim UI with column reach the end
        -- for markdown
        Title = { fg = p.blue },                                    -- text color after pound(#) sign: color of headings
        Normal = { fg = p.bright_green, bg = styles.bg },           -- text color, such as command after: in nvim, <br>
        ---------------
        -- default color in code file
        Constant = { fg = p.blue },                                 -- (preferred) any constant
        String = { fg = p.bright_yellow },                          -- a string constant: "this is a string"
        Character = { fg = p.yellow },                              -- a character constant: 'c', '\n'
        Number = { fg = p.white },                                  -- a number constant: 234, 0xff
        Boolean = { fg = p.green2 },                                -- a boolean constant: TRUE, false
        Float = { fg = p.white },                                   -- a floating point constant: 2.3e10
        -- Identifier: any variable, 
        -- this Identifier name below is also a variable, 
        -- change the color will change its color as well
        Identifier = { fg = p.green2 },                             -- (preferred) any variable name, 

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

        Special = { fg = p.bright_yellow },                         -- (preferred) any special symbol: include the telescope icon in sinppet
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

        ----------------------------------------- markdown, but acutally not working -----------------------------------------
        mkdHeading = { fg = p.yellow },
        mkdCode = { bg = p.white, fg = p.bright_black },
        markdownHeadingDelimiter = { fg = p.yellow, bold = true },
        mkdCodeDelimiter = { bg = p.bg, fg = p.text },
        mkdCodeStart = { fg = p.bright_black, style = 'bold' },
        mkdCodeEnd = { fg = p.bright_black, style = 'bold' },
        mkdLink = { fg = p.blue, style = 'underline' },

        markdownHeadingDelimiter = { fg = p.blue, style = 'bold' },
        markdownCode = { fg = p.yellow },
        markdownCodeBlock = { fg = p.bright_yellow },
        markdownH1 = { fg = p.yellow },
        markdownH2 = { fg = p.yellow },
        markdownH3 = { fg = p.yellow, style = 'bold' },
        markdownH4 = { fg = p.yellow, style = 'bold' },
        markdownLinkText = { fg = p.blue, style = 'underline' },
        ----------------------------------------- markdown -----------------------------------------

        debugPC = { bg = p.background },                            -- used for highlighting the current line in terminal-debug
        debugBreakpoint = { bg = p.background, fg = p.magenta },    -- used for breakpoint colors in terminal-debug
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


        -- ========================================================= Treesitter ===================================================================
        ["@include"] = { fg = p.bright_green },                                 -- the #include in .cpp / import in .py
        ['@method'] = { fg = p.bright_magenta },                                -- method in class, ex: student.study(), study() is a method
        ["@string"] = { fg = p.bright_yellow },
        ["@string.regex"] = { fg = p.bright_yellow },
        ["@string.escape"] = { fg = p.bright_yellow },
        ["@keyword"] = { fg = p.magenta },                                      -- For keywords that don't fall in previous categories
        ["@keyword.function"] = { fg = p.bright_magenta },                      -- const
        ["@keyword.operator"] = { fg = p.magenta },                             -- new / delete
        ["@keyword.return"] = { fg = p.magenta },
        ["@namespace"] = { fg = p.white, underline = true },
        ["@type"] = { fg = p.bright_red },                                      -- defined class type, or struct type in c++, import package method in python
        ["@type.builtin"] = { fg = p.bright_red },                              -- ?
        ["@type.definition"] = { fg = p.bright_red },                           -- Typedef
        ["@type.qualifier"] = { fg = p.bright_green },                          -- qualifier: public/private keywords in the class, or const keyword
        ["@parameter"] = { fg = p.white },
        ["@parameter.reference"] = { fg = p.white },
        ["@comment"] = { fg = p.bright_black, italic = true },
        ["@repeat"] = { fg = p.bright_magenta },
        ["@conditional"] = { fg = p.magenta },
        ["@function"] = { fg = p.blue },
        ["@function.builtin"] = { fg = p.blue },
        ["@function.call"] = { fg = p.blue },
        ["@function.macro"] = { fg = p.blue },
        ["@operator"] = { fg = p.blue },
        ["@punctuation.delimiter"] = { fg = p.white },                              -- semi-colon or dots
        ["@punctuation.bracket"] = { fg = p.white },                                -- brackets and parens
        ["@punctuation.special"] = { fg = p.white },                                -- special punctutation
        ["@variable"] = { fg = p.white },                                           -- user defined variable
        ["@variable.builtin"] = { fg = p.bright_right },                            -- variables defined by the languages, like `this` or `self`
        ["@boolean"] = { fg = p.green2 },
        ["@number"] = { fg = p.white },                                             -- backup: #4fd6be | #62D196
        ["@float"] = { fg = p.white },
        ["@constructor"] = { fg = p.blue },                                         -- weird, {} is also affected in lua require().setup{}, is it a constructor?
        ["@property"] = { fg = p.green2 },                                          -- private data member
        ["@constant"] = { fg = p.blue },
        ["@constant.builtin"] = { fg = p.blue },
        ["@constant.macro"] = { fg = p.blue },
        ["@exception"] = { fg = p.bright_red },
        ["@tag"] = { fg = p.magenta },                                                      -- html ?
        -- for markdown
        ['@punctuation.special.markdown'] = { fg = p.black, bg = p.bright_yellow2 },         -- delimiter of heading in markdown file: the "Pound" sign (#)
        ["@text.literal.markdown"] = { fg = p.green3 },                                     -- the color of normal code block inside ``` ```
        ["@text.literal.markdown_inline"] = { fg = p.black, bg = p.grey },                  -- the color of code inside ``
        ['@text'] = { fg = p.bright_red },                                                        -- color of *text* in markdown file
        --
        ['field'] = { fg = p.text },
        ['@label'] = { fg = p.blue },
        ['@property'] = { fg = p.blue },
        ['@tag.delimiter'] = { fg = p.text },
        ['@tag.attribute'] = { fg = p.blue, style = styles.italic },
        ['@title'] = { fg = groups.headings.h1, style = 'bold' },

        -- tsx/jsx
        typescriptVariable = { fg = p.bright_blue },
        typescriptExport = { fg = p.cyan },
        typescriptDefault = { fg = p.cyan },
        typescriptConstraint = { fg = p.cyan },
        typescriptBlock = { fg = p.text },
        typescriptIdentifierName = { fg = p.blue },
        typescriptTSInclude = { fg = p.cyan },
        typescriptCastKeyword = { fg = p.blue },
        typescriptEnum = { fg = p.bright_blue },
        typescriptTypeCast = { fg = p.blue },
        typescriptParenExp = { fg = p.blue },
        typescriptObjectType = { fg = p.blue },

        -- lua
        luaTSConstructor = { fg = p.white },

        -- css
        cssTSFunction = { fg = p.blue },
        cssTSProperty = { fg = p.bright_blue },
        cssTSType = { fg = p.cyan },
        cssTSKeyword = { fg = p.blue },
        cssClassName = { fg = p.cyan, style = styles.italic },
        cssPseudoClass = { fg = p.bright_blue, style = styles.italic },
        cssDefinition = { fg = p.bright_blue },
        cssTSError = { link = 'cssClassName' },

        -- LSP
        -- -------------------------------------------------------------------------------
        -- vim.lsp.buf.document_highlight()
        LspReferenceText = { bg = p.bright_blue },
        LspReferenceRead = { bg = p.bright_blue },
        LspReferenceWrite = { bg = p.bright_blue },

        -- lsp-highlight-codelens
        LspCodeLens = { fg = p.blue }, -- virtual text of code lens
        LspCodeLensSeparator = { fg = p.blue }, -- separator between two or more code lens
        -- -------------------------------------------------------------------------------

        -- NvimTree
        NvimTreeFolderIcon = { fg = p.bright_green },                           -- folder icon color
        NvimTreeFolderName = { fg = p.bright_green },                           -- folder name color
        NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },
        NvimTreeEmptyFolderName = { fg = p.white },                             -- empty folder color
        NvimTreeRootFolder = { fg = p.bright_red },                             -- root folder: meaning the folder which you open the NvimTree
        NvimTreeFileNew = { fg = p.green },                                     -- new file color
        NvimTreeImageFile = { fg = p.green3 },                                  -- color of image file
        NvimTreeNormal = { fg = p.white, bg = p.none },                         -- color of normal text-based file(.py .cpp etc), and the background
        NvimTreeNormalNC = { fg = p.bright_black, bg = p.none },                -- color of nvimTree background and the file that you opened when in a file
        NvimTreeSpecialFile = { link = 'NvimTreeNormal' },
        NvimTreeOpenedFile = { fg = p.blue, bg = p.bg },

        NvimTreeFileDeleted = { fg = p.red },
        NvimTreeFileDirty = { fg = p.bright_red },
        NvimTreeFileMerge = { fg = p.blue },
        NvimTreeFileRenamed = { fg = p.yellow },
        NvimTreeFileStaged = { fg = p.white },

        -- I want to know what are these command, but I don't know
        NvimTreeWindowPicker = { fg = groups.bg, bg = p.blue },
        NvimTreeWinSeparator = {
          fg = p.green2 == "transparent" and p.white or p.bg,
          bg = p.bg,
        },
        NvimTreeGitDeleted = { fg = groups.git_delete },
        NvimTreeGitDirty = { fg = groups.git_dirty },
        NvimTreeGitIgnored = { fg = groups.git_ignore },
        NvimTreeGitMerge = { fg = groups.git_merge },
        NvimTreeGitNew = { fg = groups.git_add },
        NvimTreeGitRenamed = { fg = groups.git_rename },
        NvimTreeGitStaged = { fg = groups.git_stage },
        

        -- Telescope
        TelescopeBorder = { fg = p.blue },                                      -- the color of the telescope border
        TelescopeNormal = { fg = p.white, bg = p.none },                        -- the color of file name & the color of telescope's background
        TelescopeMatching = { fg = p.black , bg = p.bright_yellow },            -- the color of matching as your search
        TelescopeSelection = { fg = p.black, bg = p.blue },                     -- the color of selected file
        TelescopeSelectionCaret = { fg = p.black, bg = p.blue },                -- the color of prompt in the selection 
        TelescopePromptNormal = { fg = p.blue },                                -- the color of text entered in the search prompt
        TelescopePromptPrefix = { fg = p.green3 },                              -- the color of prompt icon 
        TelescopeTitle = { fg = p.bright_yellow },                              -- the color of title on the telescope border


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
        --[[ CmpItemKindSnippet = { fg = p.whie }, ]]
        --[[ CmpItemKindVariable = { fg = p.teal1 }, ]]


        -- Buffer ?
        BufferCurrent = { fg = p.yellow, bg = p.bg },
        BufferCurrentIndex = { fg = p.yellow, bg = p.bg },
        BufferCurrentMod = { fg = p.cyan, bg = p.bg },
        BufferCurrentSign = { fg = p.blue, bg = p.bg },
        BufferCurrentTarget = { fg = p.yellow, bg = p.bg },
        BufferInactive = { fg = p.blue },
        BufferInactiveIndex = { fg = p.blue },
        BufferInactiveMod = { fg = p.cyan },
        BufferInactiveSign = { fg = p.blue },
        BufferInactiveTarget = { fg = p.yellow },
        BufferTabpageFill = { fg = groups.background, bg = groups.background },
        BufferVisible = { fg = p.blue },
        BufferVisibleIndex = { fg = p.blue },
        BufferVisibleMod = { fg = p.cyan },
        BufferVisibleSign = { fg = p.blue },
        BufferVisibleTarget = { fg = p.yellow },


        -- nvim-ts-rainbow
        --[[ rainbowcol1 = { fg = p.bright_blue }, ]]
        --[[ rainbowcol2 = { fg = p.cyan }, ]]
        --[[ rainbowcol3 = { fg = p.yellow }, ]]
        --[[ rainbowcol4 = { fg = p.bright_blue }, ]]
        --[[ rainbowcol5 = { fg = p.cyan }, ]]
        --[[ rainbowcol6 = { fg = p.magenta }, ]]
        --[[ rainbowcol7 = { fg = p.bright_blue }, ]]


        --[[ -- lewis6991/gitsigns.nvim ]]
        --[[ GitSignsAdd = { fg = groups.git_add }, ]]
        --[[ GitSignsChange = { fg = groups.git_change }, ]]
        --[[ GitSignsDelete = { fg = groups.git_delete }, ]]
        --[[ SignAdd = { link = 'GitSignsAdd' }, ]]
        --[[ SignChange = { link = 'GitSignsChange' }, ]]
        --[[ SignDelete = { link = 'GitSignsDelete' }, ]]

        --[[ -- mvllow/modes.nvim ]]
        --[[ ModesCopy = { bg = p.yellow }, ]]
        --[[ ModesDelete = { bg = p.magenta }, ]]
        --[[ ModesInsert = { bg = p.bright_black }, ]]
        --[[ ModesVisual = { bg = p.yellow }, ]]



        -- folke/which-key.nvim
        --[[ WhichKey = { fg = p.text }, ]]
        --[[ WhichKeyGroup = { fg = p.text }, ]]
        --[[ WhichKeySeparator = { fg = p.text }, ]]
        --[[ WhichKeyDesc = { fg = p.text }, ]]
        --[[ WhichKeyFloat = { bg = groups.panel }, ]]
        --[[ WhichKeyValue = { fg = p.text }, ]]

        --[[ -- luka-reineke/indent-blankline.nvim ]]
        --[[ IndentBlanklineChar = { fg = p.background1 }, ]]
        --[[ IndentBlanklineContextChar = { fg = p.yellow, gui = 'nocombine' }, ]]
        --[[ IndentBlanklineContextStart = { fg = p.yellow, gui = 'underline' }, ]]
        --[[ IndentBlanklineSpaceChar = { link = 'Whitespace' }, ]]
        --[[ IndentBlanklineSpaceCharBlankline = { link = 'Whitespace' }, ]]

        --[[ -- ray-x/lsp_signature.nvim ]]
        --[[ LspSignatureActiveParameter = { bg = p.blueGray1 }, ]]

        --[[ -- rlane/pounce.nvim ]]
        --[[ PounceAccept = { fg = p.pink3, bg = p.text }, ]]
        --[[ PounceAcceptBest = { fg = p.text, bg = p.text }, ]]
        --[[ PounceGap = { link = 'Search' }, ]]
        --[[ PounceMatch = { link = 'Search' }, ]]


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
