-- Make sure nvim can find the plugin
local current_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")
vim.opt.runtimepath:append(current_dir .. "/submodules/nvim-lspconfig")
vim.opt.runtimepath:append(current_dir .. "/submodules/mason.nvim")
vim.opt.runtimepath:append(current_dir .. "/submodules/mason-lspconfig.nvim")

--
vim.diagnostic.config({
  virtual_text = false
})
vim.keymap.set("n", "<Leader>d", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>")

-- Init plugins
require("mason").setup()
require("mason-lspconfig").setup()
