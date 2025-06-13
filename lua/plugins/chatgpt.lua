return {
        {
                "jackMort/ChatGPT.nvim",
                event = "VeryLazy",
                dependencies = {
                        "MunifTanjim/nui.nvim",
                        "nvim-lua/plenary.nvim",
                        "nvim-telescope/telescope.nvim"
                },
                config = function()
                        require("chatgpt").setup({
                                openai_params = {
                                        model = "gpt-4.1",
                                        max_tokens = 5000
                                },
                                popup_input = {
                                        submit = "<CR>"
                                }
                        })
                end
        }
}
