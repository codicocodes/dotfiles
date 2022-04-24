local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local lspkind = require("lspkind")
luasnip.filetype_extend("typescript", { "typescript" })

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    formatting = {
      format = lspkind.cmp_format({
          mode = "symbol_text",
          preset = "codicons",
          maxwidth = 50,
          menu = {
            buffer = "[buf]",
            nvim_lsp = "[lsp]",
            nvim_lua = "[api]",
            path = "[path]",
            luasnip = "[snip]",
          },
        }),
    },
    experimental = {
      native_menu = false,
      ghost_text = false,
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "path" },
      }),
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      [",."] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
})

require("luasnip.loaders.from_vscode").lazy_load()

-- CUSTOM SNIPPETS

local fmt = require("luasnip.extras.fmt").fmt

luasnip.add_snippets(
  "python",
  {
    luasnip.snippet(
      "test",
        fmt("def test_Method_Circumstance_Expectation(self):\n"..
          "  # Arrange \n\n"..
          "  # Act\n\n"..
          "  # Assert\n"..
          "  self.assertEqual(True, False)",
          {}
        )
    )
  }
)

luasnip.add_snippets(
  "javascript",
  {
    luasnip.snippet(
      "setup",
      fmt(
        "describe('method', () => {open}\n"..
        "  describe('when circumstance', () => {open}\n"..
        "    it('should expectation', () => {open}\n"..
        "      // Arrange \n\n"..
        "      // Act\n\n"..
        "      // Assert\n"..
        "      expect(true).toBe(false);\n"..
        "    {close});\n"..
        "  {close});\n"..
        "{close});",
        {
          open = "{",
          close = "}"
        })
    )
  }
)

luasnip.add_snippets(
  "javascript",
  {
    luasnip.snippet(
      "test",
      fmt(
        "describe('when circumstance', () => {open}\n"..
        "  it('should expectation', () => {open}\n"..
        "    // Arrange \n\n"..
        "    // Act\n\n"..
        "    // Assert\n"..
        "    expect(true).toBe(false);\n"..
        "  {close});\n"..
        "{close});",
        {
          open = "{",
          close = "}"
        })
    )
  }
)
