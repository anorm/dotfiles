vim.g.mapleader = ','              -- Use comma as Leader

vim.opt.wildmode = 'longest,list'  -- Make TAB completion use longest unique match (not first partial match)
vim.opt.completeopt = {"menu", "fuzzy", "longest"}
vim.opt.number = true              -- Show line numbers
vim.opt.wrapscan = false           -- Make search stop at EOF and not wrap to top
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "80"
vim.opt.foldlevel = 99
-- vim.opt.foldcolumn = "auto:9"
vim.opt.foldcolumn = "4"
vim.opt.fillchars = {
  fold = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.filetype.add({
  extension = {
    tofu = "terraform",
  },
})

