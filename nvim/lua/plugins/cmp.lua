local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<C-space>'] = cmp.mapping.complete(),
    ['<C-j>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
  },

  formatting = {
    format = function(entry, item)
      item.menu = ({
        nvim_lsp = '[lsp]',
        ultisnips = '[ultisnips]',
      })[entry.source.name]

      return item
    end,
  },
})
