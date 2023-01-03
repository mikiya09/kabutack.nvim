
----------------------------------------------------------------------------------------
-- Explained: function M.colorscheme()
-- is the colorscheme function in lua, and in this function we have a local variable
-- this: local theme = require('kabutack.theme').get(config)
-- we also have a file theme.lua, so I assume this function is calling that file, and give it the variable config that is defined here 
-- so that in the theme.lua file, config variable can be used directly
----------------------------------------------------------------------------------------

-- import the utils file as part of the startup file
-- "kabutack" is the current directory, "utils" is the file in "kabutack"
local utils = require 'kabutack.utils'

-- variables that can be import automatically by other .lua file ?
local M = {}

local config = {
    
    bold_vert_split = false,              -- what ?
    dark_variant = 'main',                -- set the main style a dark theme, so here we name it dark_variant for now
    disable_background = false,           -- transparent background
    disable_float_background = false,     -- what ?
    disable_italics = false,              -- enable
    dim_nc_background = false,            -- dimmed other windows that are not in used


    -- groups of variables for default utilities color
    groups = {
        background = 'bg',
        panel = 'bg',
        border = 'bg',
        comment = 'comment',
        link = 'green',
        punctuation = 'punct',

        error = 'red2',
        hint = 'blue',
        info = 'blue',
        warn = 'red',

        -- color of git operation, overrided by .p10l.zsh, so doesn't really matter here
        git_add = 'red',
        git_change = 'green2',
        git_delete = 'magenta',
        git_dirty = 'blue',
        git_ignore = 'bright_blue',
        git_merge = 'blue',
        git_rename = 'blue',
        git_stage = 'blue',
        git_text = 'blue',

        -- headings: I assume is used in HTML and Markdown file
        -- and it is use for the headling strings
        headings = {
            h1 = 'white',
            h2 = 'yellow',
            h3 = 'magenta',
            h4 = 'bright_magenta',
            h5 = 'blue',
            h6 = 'bright_blue',
        },
    },
    -- for highlight groups
    highlight_groups = {},
}


-- function? take in variable
------------------------------------------------------------------
function M.setup(opts)
    opts = opts or {}
    -- vim.g.poimandres_variant = opts.dark_variant or 'main'

    if opts.groups and type(opts.groups.headings) == 'string' then
        opts.groups.headings = {
            h1 = opts.groups.headings,
            h2 = opts.groups.headings,
            h3 = opts.groups.headings,
            h4 = opts.groups.headings,
            h5 = opts.groups.headings,
            h6 = opts.groups.headings,
        }
    end

  config.user_variant = opts.dark_variant or nil
  config = vim.tbl_deep_extend('force', config, opts)
end

-- function ? take in variable
------------------------------------------------------------------
function M.colorscheme()
    if vim.g.colors_name then
        vim.cmd 'hi clear'
    end

    vim.opt.termguicolors = true
    vim.g.colors_name = 'kabutack'

    -- pass the config variable to theme.lua file
    local theme = require('kabutack.theme').get(config)

    -- Set theme highlights
    for group, color in pairs(theme) do
        -- Skip highlight group if user overrides
        if config.highlight_groups[group] == nil then
            utils.highlight(group, color)
        end
    end

    -- Set user highlights
    for group, color in pairs(config.highlight_groups) do
        utils.highlight(group, color)
    end
end

return M
