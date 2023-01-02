
--- palette variants
local variants = {

    -- main color variables
    main = {
        -----------------------------------------------------------------------------------------
        -- there are three must have color, and I guess it becacuse the way utils.lua was written 
        -- they have to have specific color code, as well as the variable name
        -- so when you have time, go find out why. For now just keep them and ignore them
        teal1 = '#5DE4C7',          -- these
        teal2 = '#5FB3A1',          -- three 
        pink3 = '#D0679D',          -- color
        -----------------------------------------------------------------------------------------
        
        -------------------------------------- Color Palette ------------------------------------
        -- default
        bg = '#121212',
        fg = '#D8DEE9',
        black = '#100E23',
        white = '#D8DEE9',
        red = '#ab1c0f',
        red2 = '#a51c24',
        green = '#62D196',
        green2 = '#4fd6be',
        yellow = '#F2B482',
        blue = '#7aa2f7',
        magenta = '#A37ACC',
        cyan = '#91DDFF',

        -- bright color
        bright_black = '#3E3859',
        bright_red = '#ff757f',
        bright_green = '#A1EFD3',
        bright_yellow = '#FFE6B3',
        bright_yellow2 = '#FFFAC2',
        bright_blue = '#65B2FF',
        bright_magenta = '#D4BFFF',
        bright_cyan = '#63F2F1',
        bright_white = '#ffffff',

        -- other color 
        punct = '#DBDEE9',
        comment = '#3E3859',
        text = '#E4F0FB',
        none = 'NONE',
        -------------------------------------- Color Palette ------------------------------------

  },
}

local palette = {}

-- set main color to palette 
palette = variants.main

-- return global variable
return palette
