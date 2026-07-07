local function ggrep(text, whole_word)
  if not text or text == "" then
    return
  end

  local flags = "-F"
  if whole_word then
    flags = flags .. " -w"
  end

  vim.cmd("silent! Ggrep! " .. flags .. " -- " .. vim.fn.shellescape(text))
  vim.cmd("copen")
  vim.cmd("wincmd p")
end

return {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
    "G",
    "Ggrep",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Gedit",
    "Gvdiffsplit",
    "Gclog",
  },
  keys = {
    {
      "<leader>G", function()
        ggrep(vim.fn.expand("<cword>"), true)
      end,
      mode = "n",
      desc = "Ggrep whole word under cursor",
    },
    {
      "<leader>g",
      function()
        ggrep(vim.fn.expand("<cword>"), false)
      end,
      mode = "n",
      desc = "Ggrep word under cursor",
    },
    {
      "<leader>G",
      function()
        local selected_text = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."))[1]
        ggrep(selected_text, true)
      end,
      mode = "x",
      desc = "Ggrep whole visual selection",
    },
    {
      "<leader>g",
      function()
        local selected_text = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."))[1]
        ggrep(selected_text, false)
      end,
      mode = "x",
      desc = "Ggrep visual selection",
    },
  },
}
