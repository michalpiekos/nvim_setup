return {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
                local npairs = require("nvim-autopairs")
                npairs.setup({
                        check_ts = true,          -- use treesitter when available
                        fast_wrap = {},           -- optional: adds a wrap mapping below if enabled
                        disable_filetype = { "TelescopePrompt", "vim" },
                })

                -- If you use nvim-cmp, integrate so completion confirm also inserts pairs nicely
                local ok_cmp, cmp = pcall(require, "cmp")
                if ok_cmp then
                        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end
        end,
}
