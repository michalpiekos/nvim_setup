return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Load before other UI plugins
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",     -- latte, frappe, macchiato, mocha
      term_colors = true,    -- enables 16/256-color fallback for TTY
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = true,
        lualine = true,
        which_key = true,
        -- add others you use
      },
      color_overrides = {},
      custom_highlights = function(colors)
        return {
          CursorLine = { bg = colors.surface0 },
          Comment = { fg = colors.overlay1, style = { "italic" } },
        }
      end,
    })

    -- Apply your preferred flavor
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
