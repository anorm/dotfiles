 -- Highlight word under cursor like `*`, but don't jump.
 -- Still sets the last-search pattern, so `n`/`N` work.
 vim.keymap.set("n", "<leader>*", function()
   local word = vim.fn.expand("<cword>")
   -- very nomagic + whole-word boundaries; escape backslashes for \V
   vim.fn.setreg("/", ([[\V\<%s\>]]):format(vim.fn.escape(word, [[\]])))
   vim.v.searchforward = 1
   vim.opt.hlsearch = true
 end, { silent = true, desc = "HL word under cursor (no jump)" })
