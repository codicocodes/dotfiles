local cmp = require("cmp")
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    sources = {
      { name = "ultisnips" },
      { name = 'nvim_lsp' },
      -- more sources
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
    mapping = {
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<C-Space>"] = cmp.mapping(function(fallback)
        if vim.fn.pumvisible() == 1 then
          if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
            return vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippet()<CR>"))
          end

          vim.fn.feedkeys(t("<C-n>"), "n")
        elseif check_back_space() then
          vim.fn.feedkeys(t("<cr>"), "n")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.fn.complete_info()["selected"] == -1 and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
        vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippet()<CR>"))
      elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        vim.fn.feedkeys(t("<ESC>:call UltiSnips#JumpForwards()<CR>"))
      elseif vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-n>"), "n")
      elseif check_back_space() then
        vim.fn.feedkeys(t("<tab>"), "n")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
      return vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpBackwards()<CR>"))
    elseif vim.fn.pumvisible() == 1 then
      vim.fn.feedkeys(t("<C-p>"), "n")
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
      },
    })

-- Add js/ts snippets for jsx/tsx files
vim.cmd 'augroup ultisnips_user_events'
vim.cmd 'au!'
vim.cmd 'au FileType javascriptreact UltiSnipsAddFiletypes javascript'
vim.cmd 'au FileType typescriptreact UltiSnipsAddFiletypes typescript'
vim.cmd 'augroup END'
