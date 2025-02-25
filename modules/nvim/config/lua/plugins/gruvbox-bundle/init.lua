-- Make sure nvim can find the plugin
local current_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")
vim.opt.runtimepath:append(current_dir .. "/submodules/gruvbox.nvim")

-- Color scheme
vim.opt.background = "dark"
require("gruvbox").setup({
  contrast = "hard",
})
vim.cmd([[colorscheme gruvbox]])
