return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox",
                                icons_enabled = false,
                                component_separators = {left = '|', right = '|'},
                                section_separators = {left = '', right = ''},
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
