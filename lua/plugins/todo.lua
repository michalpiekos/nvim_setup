return {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
                require("todo-comments").setup({
                        search = {
                                command = "rg",
                                args = {
                                        "--color=never",
                                        "--no-heading",
                                        "--with-filename",
                                        "--line-number",
                                        "--column",
                                        --"--glob", "!nrf/**",
                                        --"--glob", "!nrfxlib/**",
                                        --"--glob", "!modules/**",
                                        --"--glob", "!zephyr/**",
                                        --"--glob", "!bootloader/**",
                                        --"--glob", "!build/**",
                                },
                        },
                        keywords = {
                                FIX = {
                                        icon = " ", -- icon used for the sign, and in search results
                                        color = "error", -- can be a hex color, or a named color (see below)
                                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "ERR" }, -- a set of other keywords that all map to this FIX keywords
                                        -- signs = false, -- configure signs for some keywords individually
                                },
                                TODO = { icon = " ", color = "info", alt = { "DOIT", "TASK" } },
                                DEV = { icon = "󰚗", color = "info" },
                                HACK = { icon = " ", color = "warning" },
                                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                                PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                                TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
                        },
                })
        end,
}

