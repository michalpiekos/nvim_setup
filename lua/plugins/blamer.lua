return {
	"APZelos/blamer.nvim",
	config = function()
                vim.g.blamer_show_in_insert_modes = 0
                -- vim.api.nvim_del_keymap('n', '<leader>gt')
                vim.keymap.set('n', '<leader>gt', ':BlamerToggle<CR>', {})
	end,
}
