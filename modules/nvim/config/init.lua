vim.g.mapleader = ','            -- Use comma as Leader
vim.o.wildmode = 'longest,list'  -- Make TAB completion use longest unique match (not first partial match)
vim.wo.number = true             -- Show line numbers
vim.o.wrapscan = false           -- Make search stop at EOF and not wrap to top

-- Key mappings
vim.keymap.set("n", "<leader><leader>", "<cmd>Files<cr>")
