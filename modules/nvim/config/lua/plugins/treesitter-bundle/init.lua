-- Make sure nvim can find the plugin
local current_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")
vim.opt.runtimepath:append(current_dir .. "/submodules/nvim-treesitter")
vim.opt.runtimepath:append(current_dir .. "/submodules/nvim-treesitter-context")

-- Init
require("nvim-treesitter").setup()
require'nvim-treesitter'.install {
    'bash',
    'javascript',
    'json',
    'python',
    'rust',
    'yaml',
    'zig',
    'zsh',
}
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python' },
  callback = function()
      vim.treesitter.start()
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[0][0].foldmethod = 'expr'
  end,
})

require("treesitter-context").setup()


-- Key mappings
-- vim.keymap.set("n", "-", "<cmd>Oil<cr>")
