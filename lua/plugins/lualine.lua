return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
			},
			sections = {
				lualine_z = {                                                                                                                                           
                                        {                                                                                                                                               
                                                function()                                                                                                                              
                                                        return string.format('Ln %d, Col %d', vim.fn.line('.'), vim.fn.virtcol('.'))                                                    
                                                end,                                                                                                                                    
                                        },                                                                                                                                              
                                },
			},
		})
	end,
}
