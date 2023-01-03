

-- grab palette values
local palette = require('kabutack.palette')

-- lualine variable
local kabutack = {}


------------------------------------------------------------------------------------------------------------------
-- based on configuration in lualine.lua, sections are labeled with a, b, c, x, y, z 
-- a: mode 
-- b: branch, diff, diagnostics 
-- c: filename 
-- x: encoding, fileformat, filetype 
-- y: progress 
-- z: location 
------------------------------------------------------------------------------------------------------------------
-- normal mode
kabutack.normal = {
    a = { fg = palette.black, bg = palette.green2, gui = 'bold' },               -- "normal text sign" section
    b = { fg = palette.green2, bg = palette.black },                             -- "branch" section
    c = { fg = palette.bright_green,  bg = palette.none },                       -- "file" section: no background in the middle so that transparent background look nicer
}

-- insert mode 
kabutack.insert = {
    a = { fg = palette.black, bg = palette.bright_yellow2, gui = 'bold' },       -- "normal text sign" section
    b = { fg = palette.bright_yellow2, bg = palette.black },                     -- "branch" section
}

-- visual mode
kabutack.visual = {
    a = { fg = palette.black, bg = palette.green3, gui = 'bold' },               -- "normal text sign" section
    b = { fg = palette.green3, bg = palette.black },                             -- "branch" section
}

-- replace mode 
kabutack.replace = {
    a = { fg = palette.black, bg = palette.green, gui = 'bold' },                -- "normal text sign" section
    b = { fg = palette.green2, bg = palette.black },                             -- "branch" section
}

-- command mode: when you type : and enter some command
kabutack.command = {
    a = { fg = palette.black, bg = palette.bright_yellow, gui = 'bold' },        -- "normal text sign" section
    b = { fg = palette.bright_yellow, bg = palette.black },                      -- "branch" section
}

-- inactive mode 
kabutack.inactive = {
    a = { fg = palette.black, bg = palette.green, gui = 'bold' },                -- "normal text sign" section
    b = { fg = palette.green2, bg = palette.black },                             -- "branch" section
}

return kabutack
