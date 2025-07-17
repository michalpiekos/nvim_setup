return {
        {
                "frankroeder/parrot.nvim",
                dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
                -- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
                config = function()
                        require("parrot").setup {
                                -- Providers must be explicitly set up to make them available.
                                providers = {
                                        openai = {
                                                name = "openai",
                                                api_key = os.getenv "OPENAI_API_KEY",
                                                endpoint = "https://api.openai.com/v1/chat/completions",
                                                params = {
                                                        chat = { temperature = 1.1, top_p = 1 },
                                                        command = { temperature = 1.1, top_p = 1 },
                                                },
                                                topic = {
                                                        model = "gpt-4.1",
                                                        params = { max_completion_tokens = 64 },
                                                },
                                                models ={
                                                        "gpt-4o",
                                                        "o4-mini",
                                                        "gpt-4.1",
                                                }
                                        },
                                },
                                chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },
                        }
                end,
        }
}
