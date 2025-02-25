vim.g.mapleader = ','              -- Use comma as Leader
vim.opt.wildmode = 'longest,list'  -- Make TAB completion use longest unique match (not first partial match)
vim.opt.number = true              -- Show line numbers
vim.opt.wrapscan = false           -- Make search stop at EOF and not wrap to top
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Key mappings
vim.keymap.set("n", "<leader><leader>", "<cmd>Files<cr>")

-- Color scheme
vim.opt.background = "dark"
require("gruvbox").setup({
  contrast = "hard",
})
vim.cmd([[colorscheme gruvbox]])

-- Init oil
require("oil").setup()
