return {
    {
        'stevearc/oil.nvim',
        opts = {
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
        },
        -- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        keys = {
            {"-", "<cmd>Oil<cr>", desc="Open Oil"},
        },
        lazy = false,
    }
}
