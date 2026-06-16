-- Make sure nvim can find the plugin
local current_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")
vim.opt.runtimepath:append(current_dir .. "/submodules/nvim-lspconfig")
vim.opt.runtimepath:append(current_dir .. "/submodules/mason.nvim")
vim.opt.runtimepath:append(current_dir .. "/submodules/mason-lspconfig.nvim")

--
vim.diagnostic.config({
  virtual_text = false
})
vim.keymap.set("n", "<Leader>d", ":lua vim.diagnostic.open_float(0, {scope='line',source='always'})<CR>")

vim.lsp.config("terraformls", {
  init_options = {
    terraform = {
        path = vim.fn.exepath("tofu")
    }
  },
})

vim.lsp.config("pyright", {
  settings = {
    pyright = {
      disableTaggedHints = true,
    },
  },
})

-- Init plugins
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
      "pyright",
      "rust_analyzer",
      "terraformls",
  },
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition,         { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration,        { desc = "Go to declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation,     { desc = "Go to implementation" })
