local modules = {}

-- Remove plugin from modules.global.init
-- modules['kevinhwang91/rnvimr'] = false
-- Rewrite plugin settings from modules.global.init
-- modules['kevinhwang91/rnvimr'] = {
--     your code
-- }

-- Add new plugin
-- modules['sheerun/vim-polyglot'] = {
--     your code
-- }

modules["lvim-tech/lvim-colorscheme"] = false

modules['navarasu/onedark.nvim'] = {
    event = "VimEnter",
    config = [[vim.cmd('colorscheme onedark')]]
}

return modules
