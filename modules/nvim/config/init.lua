-- Use comma as Leader
vim.g.mapleader = ','

-- Make TAB completion use longest unique match (not first partial match)
vim.o.wildmode = 'longest,list'

-- Line numbers
vim.wo.number = true

-- Key mappings
vim.keymap.set("n", "<leader><leader>", "<cmd>Files<cr>")
