return {
        {
                "nvim-neo-tree/neo-tree.nvim",
                branch = "v3.x",
                dependencies = {
                        "nvim-lua/plenary.nvim",
                        --"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                        "MunifTanjim/nui.nvim",
                        --"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
                },
                config = function()
                        require("neo-tree").setup({
                                window = {
                                        mappings = {
                                                ["<2-LeftMouse>"] = "open_tab_drop",
                                                ["<cr>"] = "open_tab_drop",
                                                -- ["<cr>"] = "open_tabnew",
                                                ["t"] = "open",
                                        }
                                },
                                filesystem = {
                                        filtered_items = {
                                                visible = true, -- when true, they will just be displayed differently than normal items
                                                hide_dotfiles = false,
                                                hide_gitignored = false,
                                        },
                                },
                                default_component_configs = {
                                        icon = {
                                                folder_closed = ">",
                                                folder_open = "v",
                                                folder_empty = "-",
                                                default = " ",
                                        },
                                        modified = {
                                                symbol = "*",
                                        },
                                },
                        })
                        vim.keymap.set('n', '<Leader>tb', ':Neotree filesystem reveal bottom<CR>', {})
                        vim.keymap.set('n', '<Leader>tr', ':Neotree filesystem reveal right<CR>', {})
                        vim.keymap.set('n', '<Leader>tl', ':Neotree filesystem reveal left<CR>', {})
                        vim.keymap.set('n', '<Leader>tt', ':Neotree toggle<CR>', {})
                end
        }
}
