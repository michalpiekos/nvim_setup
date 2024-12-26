return {
        'folke/which-key.nvim',
        config = function()
                require("which-key").setup({
                        plugins = {
                                marks = true,         -- Shows a list of your marks
                                registers = true,     -- Shows your registers
                                spelling = {
                                        enabled = false,   -- Enables spell suggestions
                                        --suggestions = 20, -- Maximum number of suggestions
                                },
                        },
                        replace = {
                                ["<leader>"] = "SPC",
                                ["<cr>"] = "RET",
                                ["<tab>"] = "TAB",
                        },
                        win = {
                                border = "single",    -- Adds a border to the popup
                        },
                        layout = {
                                align = "center",     -- Center-align the key labels
                        },
                })
        end
}

