local config = {}

function config.dashboard()
    vim.g.dashboard_custom_header = {
        "       888    /8   Y88b      /   888        e    e             ",
        "       888   / 8    Y88b    /    888       d8b  d8b            ",
        "       888  /  8     Y88b  /     888      d888bdY88b           ",
        "       888 /   8      Y888/      888     / Y88Y Y888b          ",
        "       888/    8       Y8/       888    /   YY   Y888b         ",
        "       88Y     8        Y        888   /          Y888b        "
    }
    vim.g.dashboard_preview_file_height = 12
    vim.g.dashboard_preview_file_width = 80
    vim.g.dashboard_custom_section = {
        a = {
            description = {"     Projects                 "},
            command = "CtrlSpace b"
        },
        b = {
            description = {"     File explorer            "},
            command = "Vifm"
        },
        c = {
            description = {"     Search file              "},
            command = "SnapFiles"
        },
        d = {
            description = {"     Search in files          "},
            command = "SnapGrep"
        },
        e = {
            description = {"     Help                     "},
            command = ":LvimHelper"
        },
        f = {
            description = {"     Settings                 "},
            command = ":e ~/.config/nvim/lua/configs/global/lvim.lua"
        },
        g = {
            description = {"     Readme                   "},
            command = ":e ~/.config/nvim/README.md"
        }
    }
end

function config.galaxyline()
    local gl = require('galaxyline')
    local colors = require('galaxyline.theme').default
    local condition = require('galaxyline.condition')
    local gls = gl.section
    gl.short_line_list = {'NvimTree','vista','dbui','packer'}

    gls.left[1] = {
    RainbowRed = {
        provider = function() return '▊ ' end,
        highlight = {colors.blue,colors.bg}
    },
    }
    gls.left[2] = {
    ViMode = {
        provider = function()
        -- auto change color according the vim mode
        local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
                            [''] = colors.blue,V=colors.blue,
                            c = colors.magenta,no = colors.red,s = colors.orange,
                            S=colors.orange,[''] = colors.orange,
                            ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                            cv = colors.red,ce=colors.red, r = colors.cyan,
                            rm = colors.cyan, ['r?'] = colors.cyan,
                            ['!']  = colors.red,t = colors.red}
        vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
        return '  '
        end,
        highlight = {colors.red,colors.bg,'bold'},
    },
    }
    gls.left[3] = {
    FileSize = {
        provider = 'FileSize',
        condition = condition.buffer_not_empty,
        highlight = {colors.fg,colors.bg}
    }
    }
    gls.left[4] ={
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
    },
    }

    gls.left[5] = {
    FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.magenta,colors.bg,'bold'}
    }
    }

    gls.left[6] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.fg,colors.bg},
    },
    }

    gls.left[7] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.fg,colors.bg,'bold'},
    }
    }

    gls.left[8] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red,colors.bg}
    }
    }
    gls.left[9] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.yellow,colors.bg},
    }
    }

    gls.left[10] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.cyan,colors.bg},
    }
    }

    gls.left[11] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue,colors.bg},
    }
    }

    gls.mid[1] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function ()
        local tbl = {['dashboard'] = true,['']=true}
        if tbl[vim.bo.filetype] then
            return false
        end
        return true
        end,
        icon = ' LSP:',
        highlight = {colors.cyan,colors.bg,'bold'}
    }
    }

    gls.right[1] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.green,colors.bg,'bold'}
    }
    }

    gls.right[2] = {
    FileFormat = {
        provider = 'FileFormat',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.green,colors.bg,'bold'}
    }
    }

    gls.right[3] = {
    GitIcon = {
        provider = function() return '  ' end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.violet,colors.bg,'bold'},
    }
    }

    gls.right[4] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = {colors.violet,colors.bg,'bold'},
    }
    }

    gls.right[5] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.green,colors.bg},
    }
    }
    gls.right[6] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.orange,colors.bg},
    }
    }
    gls.right[7] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red,colors.bg},
    }
    }

    gls.right[8] = {
    RainbowBlue = {
        provider = function() return ' ▊' end,
        highlight = {colors.blue,colors.bg}
    },
    }

    gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.blue,colors.bg,'bold'}
    }
    }

    gls.short_line_left[2] = {
    SFileName = {
        provider =  'SFileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.fg,colors.bg,'bold'}
    }
    }

    gls.short_line_right[1] = {
    BufferIcon = {
        provider= 'BufferIcon',
        highlight = {colors.fg,colors.bg}
    }
    }
end

function config.indent_blankline()
    vim.g.indent_blankline_char = "▏"
    vim.g.indent_blankline_show_first_indent_level = true
    vim.g.indent_blankline_filetype_exclude = {
        "startify",
        "dashboard",
        "dotooagenda",
        "log",
        "fugitive",
        "gitcommit",
        "packer",
        "vimwiki",
        "markdown",
        "json",
        "txt",
        "vista",
        "help",
        "todoist",
        "NvimTree",
        "peekaboo",
        "git",
        "TelescopePrompt",
        "undotree",
        "flutterToolsOutline"
    }
    vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_show_current_context = true
    vim.g.indent_blankline_context_patterns = {
        "class",
        "function",
        "method",
        "block",
        "list_literal",
        "selector",
        "^if",
        "^table",
        "if_statement",
        "while",
        "for"
    }
    vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
end

-- function config.chadtree()

--     local chadtree_settings = {
--         profiling = true,
--         ignore = {name_exact = {".*"}, name_glob = {'.*'}},
--         keymap = {open_sys = {'e'}, primary = {'<enter>', 'o'}},
--         theme = {
--             icon_glyph_set = 'devicons',
--             discrete_colour_map = {
--                 black = "#2E3440",
--                 red = "#ff5c57",
--                 green = "#f78c6c",
--                 yellow = "#F2AF5C",
--                 blue = "#1C9898",
--                 magenta = "#00839F",
--                 cyan = "#25B8A5",
--                 white = "#D9DA9E",
--                 bright_black = "#2E3440",
--                 bright_red = "#ff5c57",
--                 bright_green = "#f78c6c",
--                 bright_yellow = "#F2AF5C",
--                 bright_blue = "#1C9898",
--                 bright_magenta = "#00839F",
--                 bright_cyan = "#25B8A5",
--                 bright_white = "#D9DA9E"
--             }
--         }
--     }
--     vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
-- end

function config.tree()
    vim.g.nvim_tree_disable_netrw = 0
    vim.g.nvim_tree_hide_dotfiles = 1
    vim.g.nvim_tree_indent_markers = 0
    vim.g.nvim_tree_follow = 1
    vim.g.nvim_tree_lsp_diagnostics = 0
    vim.g.nvim_tree_auto_close = true
    vim.g.nvim_tree_auto_ignore_ft = {"startify", "dashboard"}
    vim.g.nvim_tree_show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 0
    }
    vim.g.nvim_tree_icons = {
        default = "",
        symlink = "",
        git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "➜",
            untracked = "",
            ignored = "◌"
        },
        folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = ""
        }
    }

    vim.cmd("lua require'nvim-tree'.setup()")
end

function config.goyo()
    local opts = {silent = true, noremap = true}
    vim.api.nvim_set_keymap("n", "<C-z>", ":Goyo<CR>", opts)
    -- TODO handle this better
    vim.api.nvim_exec(
        [[
        function! Goyo_enter()
        set noshowcmd
        Limelight
        endfunction

        function! Goyo_leave()
        set showcmd
        Limelight!
        endfunction

        autocmd! User GoyoEnter nested call Goyo_enter()
        autocmd! User GoyoLeave nested call Goyo_leave()
    ]],
        true
    )
end

function config.limelight()
    vim.g.limelight_conceal_guifg = "#628b97"
end

function config.floaterm()
    vim.g.floaterm_keymap_toggle = "<F1>"
    vim.g.floaterm_keymap_next = "<F2>"
    vim.g.floaterm_keymap_prev = "<F3>"
    vim.g.floaterm_keymap_new = "<F4>"
    vim.g.floaterm_keymap_kill = "<F12>"
    vim.g.floaterm_title = "Floaterm ($1/$2)"
    vim.g.floaterm_shell = vim.o.shell
    vim.g.floaterm_autoinsert = 1
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_wintitle = 0
    vim.g.floaterm_autoclose = 1
end

function config.helper()
    local home = os.getenv("HOME")
    require("lvim-helper").setup(
        {
            files = {
                home .. "/.config/nvim/help/lvim_commands.md",
                home .. "/.config/nvim/help/lvim_bindings_normal_mode.md",
                home .. "/.config/nvim/help/lvim_bindings_visual_mode.md",
                home .. "/.config/nvim/help/lvim_bindings_debug_vimspector.md",
                home .. "/.config/nvim/help/lvim_bindings_debug_dap.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_global.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_cursor_movement.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_visual_mode.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_visual_commands.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_insert_mode.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_editing.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_registers.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_marks_and_positions.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_macros.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_cut_and_paste.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_indent_text.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_exiting.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_search_and_replace.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_search_in_multiple_files.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_tabs.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_working_with_multiple_files.md",
                home .. "/.config/nvim/help/vim_cheat_sheet_diff.md"
            }
        }
    )
end

return config
