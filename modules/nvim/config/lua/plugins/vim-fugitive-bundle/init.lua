-- Make sure nvim can find the plugin
local current_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")
vim.opt.runtimepath:append(current_dir .. "/submodules/vim-fugitive")

-- Key mappings
local function ggrep(text)
  if not text or text == "" then
    return
  end
  vim.cmd("silent! Ggrep! -F -- " .. vim.fn.shellescape(text))
  vim.cmd("copen")
  vim.cmd("wincmd p")
end

vim.keymap.set("n", "<leader>g", function()
  ggrep(vim.fn.expand("<cword>"))
end, { desc = "Ggrep word under cursor" })

vim.keymap.set("x", "<leader>g", function()
  local selected_text = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."))[1]
  ggrep(selected_text)
end, { desc = "Ggrep visual selection" })
