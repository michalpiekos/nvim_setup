return {
        {
                "nvim-telescope/telescope-ui-select.nvim",
                config = function()
                        require("telescope").setup({
                                extensions = {
                                        ["ui-select"] = {
                                                require("telescope.themes").get_dropdown {
                                                }
                                        }
                                },
                                defaults = {
                                        layout_strategy = 'vertical',
                                        layout_config = {
                                                horizontal = {
                                                        preview_cutoff = 0,
                                                        width = 0.8,
                                                        preview_width = 0.6,
                                                },
                                                vertical = {
                                                        width = 0.9,
                                                        preview_width = 0.6,
                                                },
                                        -- vimgrep_arguments = {
                                        --         '--regexp',
                                        --         },
                                        },
                                },
                                pickers = {
                                        find_files = {
                                                theme = "dropdown",
                                                layout_config = {
                                                        width = 0.9,
                                                },
                                        },
                                },
                        })
                        require("telescope").load_extension("ui-select")
                end
        },
        {
                'nvim-telescope/telescope.nvim', tag = '0.1.6',
                dependencies = {
                        {
                                'nvim-lua/plenary.nvim'
                        },
                        {
                                "nvim-telescope/telescope-live-grep-args.nvim" ,
                                -- This will not install any breaking changes.
                                -- For major updates, this must be adjusted manually.
                                version = "^1.0.0",
                        },
                },

                config = function()
                        local builtin = require("telescope.builtin")
                        -- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
                        -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
                        vim.keymap.set('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
                        vim.keymap.set('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', {})
                        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
                        --vim.keymap.set('n', '<leader>fq', ':Telescope quickfix<CR>', {})
                        require("telescope").load_extension("live_grep_args")
                        local live_grep_args = require("telescope-live-grep-args.shortcuts")
                        vim.keymap.set("n", "<leader>fc", live_grep_args.grep_word_under_cursor)
                        vim.keymap.set("v", "<leader>fg", live_grep_args.grep_visual_selection, {
                                noremap = true, silent = true, desc="Live grep with highlighted text"
                        })
                        vim.keymap.set("v", "<leader>ff", function()
                                local function get_visual_selection()
                                        vim.cmd('noau normal! "vy"')
                                        return vim.fn.getreg("v")
                                end
                                require("telescope.builtin").find_files({ default_text = get_visual_selection() })
                        end, { noremap = true, silent = true, desc = "Find file from selection" })
                end
        },
}

