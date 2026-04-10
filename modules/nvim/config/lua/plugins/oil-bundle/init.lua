-- Make sure nvim can find the plugin
local current_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")
vim.opt.runtimepath:append(current_dir .. "/submodules/oil.nvim")

-- Init oil
require("oil").setup({
    git = {
        -- Return true to automatically git add/mv/rm files
        add = function(path)
          return false
        end,
        mv = function(src_path, dest_path)
          return true
        end,
        rm = function(path)
          return true
        end,
    },
})

-- Key mappings
vim.keymap.set("n", "-", "<cmd>Oil<cr>")
