return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
        local luasnip = require('luasnip')
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Custom function to filter out "Text" kind items
      local function custom_filter(entry, ctx)
        local kind = require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]
        if kind == "Text" then
          return false  -- Filter out entries of kind "Text"
        end
        return true
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            --require("lspconfig").lsp_expand(args.body)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
                autocomplete = false,
        },
        window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", entry_filter = custom_filter },
          --{ name = "luasnip" }, -- For luasnip users.
          --{ name = "buffer" },
          { name = "path" },
        }),
        -- Filter out "text" entries to avoid duplicate or irrelevant suggestions.
        formatting = {
          format = function(entry, vim_item)
            -- Ensure vim_item is not nil and filter out suggestions of kind "Text"
            if vim_item and vim_item.kind ~= "Text" then
              return vim_item
            end
          end,
        },
        -- Make sure that invalid entries are properly filtered
        experimental = {
          ghost_text = false, -- Optionally disable ghost text
        },
        preselect = cmp.PreselectMode.None,
      })
    end,
  },
}
