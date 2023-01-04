
--- palette variants
local variants = {

    -- main color variables
    main = {

        -- default
        bg = '#121212',
        fg = '#D8DEE9',
        black = '#100E23',
        white = '#D8DEE9',
        grey = '#84848c',
        red = '#ab1c0f',
        red2 = '#a51c24',
        green = '#62D196',
        green2 = '#4fd6be',
        green3 = '#79A8A9',
        green4 = '#64868E',
        yellow = '#F2B482',
        blue = '#7aa2f7',
        magenta = '#A37ACC',
        cyan = '#91DDFF',

        -- bright color
        bright_black = '#3E3859',
        bright_red = '#ff757f',
        bright_green = '#A1EFD3',
        bright_green2 = '#d4fec7',
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
  },
}

local palette = {}

-- set main color to palette 
palette = variants.main

-- return global variable
return palette
