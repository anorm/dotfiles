-- Make sure nvim can find the plugin
local current_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")
vim.opt.runtimepath:append(current_dir .. "/submodules/fzf")
vim.opt.runtimepath:append(current_dir .. "/submodules/fzf.vim")

-- Keymap
vim.keymap.set("n", "<leader><leader>", "<cmd>Files<cr>")
