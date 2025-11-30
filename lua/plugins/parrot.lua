return {
        {
                "frankroeder/parrot.nvim",
                dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
                -- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
                config = function()
                        require("parrot").setup {
                                -- Providers must be explicitly set up to make them available.
                                providers = {
                                        xai = {
                                                name = "xai",
                                                endpoint = "https://api.x.ai/v1/chat/completions",
                                                model_endpoint = "https://api.x.ai/v1/language-models",
                                                api_key = os.getenv "XAI_API_KEY",
                                                params = {
                                                        chat = { temperature = 1.1, top_p = 1 },
                                                        command = { temperature = 1.1, top_p = 1 },
                                                },
                                                topic = {
                                                        model = "grok-4-1-fast-reasoning",
                                                        params = { max_completion_tokens = 64 },
                                                },
                                                models = {
                                                        "grok-4-1-fast-reasoning",
                                                        "grok-code-fast-1",
                                                },
                                        },
                                        openai = {
                                                name = "openai",
                                                api_key = os.getenv "OPENAI_API_KEY",
                                                endpoint = "https://api.openai.com/v1/chat/completions",
                                                params = {
                                                        chat = { temperature = 1.1, top_p = 1 },
                                                        command = { temperature = 1.1, top_p = 1 },
                                                },
                                                topic = {
                                                        model = "gpt-5.1",
                                                        params = { max_completion_tokens = 128 },
                                                },
                                                models ={
                                                        "gpt-5.1",
                                                        "gpt-5-mini",
                                                }
                                        },
                                },
                                chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },
                        }
                end,
        }
}
