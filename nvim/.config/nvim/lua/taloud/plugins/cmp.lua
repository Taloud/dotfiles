return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- 'hrsh7th/cmp-copilot',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')
    local cmp_select = {behavior = cmp.SelectBehavior.Select}

    require('luasnip/loaders/from_snipmate').lazy_load()

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local source_map = {
      buffer = "Buffer",
      nvim_lsp = "LSP",
      nvim_lsp_signature_help = "Signature",
      luasnip = "LuaSnip",
      nvim_lua = "Lua",
      path = "Path",
      copilot = "Copilot",
    }

    local function ltrim(s)
      return s:match'^%s*(.*)'
    end

    cmp.setup({
      preselect = false,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      view = {
        entries = { name = 'custom', selection_order = 'near_cursor' },
      },
      window = {
        completion = {
          col_offset = -2 -- align the abbr and word on cursor (due to fields order below)
        }
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = 'symbol',
          -- See: https://www.reddit.com/r/neovim/comments/103zetf/how_can_i_get_a_vscodelike_tailwind_css/
          before = function(entry, vim_item)
            -- Replace the 'menu' field with the kind and source
            vim_item.menu = '  ' .. vim_item.kind .. ' (' .. (source_map[entry.source.name] or entry.source.name) .. ')'
            vim_item.menu_hl_group = 'SpecialComment'

            vim_item.abbr = ltrim(vim_item.abbr)

            if vim_item.kind == 'Color' and entry.completion_item.documentation then
              local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
              if r then
                local color = string.format('%02x', r) .. string.format('%02x', g) ..string.format('%02x', b)
                local group = 'Tw_' .. color
                if vim.fn.hlID(group) < 1 then
                  vim.api.nvim_set_hl(0, group, {fg = '#' .. color})
                end
                vim_item.kind_hl_group = group
                return vim_item
              end
            end

            return vim_item
          end
        }),
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ["<c-y>"] = cmp.mapping(
          cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
          { "i", "c" }
        ),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        -- { name = 'copilot' },
        { name = 'buffer' },
        { name = 'path' },
      },
      experimental = {
        -- ghost_text = true,
      },
    })
  end,
}
