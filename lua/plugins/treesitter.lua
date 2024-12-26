return {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
                local config = require("nvim-treesitter.configs")
                config.setup({
                        ensure_installed = {
                                "arduino", "asm", "bash", "bitbake", "c",
                                "cmake", "cpp", "devicetree", "gitignore",
                                "go", "groovy", "html", "javascript", "kconfig",
                                "linkerscript", "lua", "make", "markdown",
                                "perl", "python", "printf", "proto", "rst", "rust",
                                "ssh_config", "sql", "tmux", "toml", "udev",
                                "yaml"
                        },
                        --highlight = { enable = true },
                        --indent = { enable = true },
                        --incremental_selection = { enable = true },
                        --textobjects = {
                        --        select = {
                        --                enable = true,
                        --                lookahead = true,
                        --                keymaps = {
                        --                        ["af"] = "@function.outer",
                        --                        ["if"] = "@function.inner",
                        --                },
                        --        },
                        --        move = {
                        --                enable = true,
                        --                set_jumps = true,
                        --                goto_next_start = {
                        --                        ["]f"] = "@function.outer",
                        --                },
                        --                goto_next_end = {
                        --                        ["]F"] = "@function.outer",
                        --                },
                        --                goto_previous_start = {
                        --                        ["[f"] = "@function.outer",
                        --                },
                        --                goto_previous_end = {
                        --                        ["[F"] = "@function.outer",
                        --                },
                        --        },
                        --},
                })
        end
}
