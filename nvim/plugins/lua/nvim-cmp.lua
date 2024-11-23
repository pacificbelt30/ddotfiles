-- Setup nvim-cmp.
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require'cmp'

cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      --vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- tab補完
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      --elseif Ultisnips.expand_or_jumpable() then
        --Ultisnips.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      --elseif luasnip.jumpable(-1) then
        --luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<A-y>"] = require('minuet').make_cmp_map(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp_signature_help' },
    -- { name = 'cmp_ai' },
    -- { name = 'minuet' },
    { name = "latex_symbols" },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = function(entry, vim_item)
      local source_names = {
        nvim_lsp = "[LSP]",
        cmp_ai = "[AI]",
        luasnip = "[Snippet]",
      }
      vim_item.menu = source_names[entry.source.name]
      return vim_item
    end,
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "texlab", "clangd", "gopls"}
})

-- lsp setting
require('lspconfig')['pyright'].setup {
  capabilities = capabilities,
  on_new_config = function(config, root_dir)
    if vim.fn.executable('poetry') then
      local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
      if string.len(env) > 0 then
        config.settings.python.pythonPath = env .. '/bin/python'
      end
    end
  end
}

require('lspconfig')['texlab'].setup {
  capabilities = capabilities
}

require('lspconfig')['clangd'].setup {
  capabilities = capabilities
}

require('lspconfig')['gopls'].setup {
  capabilities = capabilities
}

require('lspconfig')['ts_ls'].setup {
  capabilities = capabilities
}

local cmp_ai = require('cmp_ai.config')

-- cmp_ai:setup({
--   max_lines = 1000,
--   provider = 'OpenAI',
--   provider_options = {
--     model = 'gpt-4o-mini',
--   },
--   notify = true,
--   notify_callback = function(msg)
--     vim.notify(msg)
--   end,
--   run_on_every_keystroke = true,
--   ignored_file_types = {
--     -- default is not to ignore
--     -- uncomment to ignore in lua:
--     -- lua = true
--   },
-- })

-- local cmp_ai = require('cmp_ai.config')
-- cmp_ai:setup({
--   max_lines = 100,
--   provider = 'Ollama',
--   provider_options = {
--     model = 'qwen2.5-coder:1.5b',
--     base_url = 'http://192.168.1.19:11434/api/generate',
--     stream = true,
--   },
--   notify = true,
--   notify_callback = function(msg)
--     vim.notify(msg)
--   end,
--   run_on_every_keystroke = true,
-- })

require('minuet').setup {
  -- provider = 'openai',
  provider = 'gemini',
  -- provider = 'openai_compatible',
  -- provider = 'openai_fim_compatible',
  provider_options = {
      gemini = {
          model = 'gemini-1.5-flash-002',
          system = default_system,
          few_shots = default_few_shots,
          stream = true,
          optional = {},
      },
      openai = {
          model = 'gpt-4o-mini',
          system = default_system,
          few_shots = default_few_shots,
          stream = true,
          optional = {
              -- pass any additional parameters you want to send to OpenAI request,
              -- e.g.
              -- stop = { 'end' },
              -- max_tokens = 256,
              -- top_p = 0.9,
          },
      },
      openai_compatible = {
              -- model = 'starcoder2:3b',
              model = 'qwen2.5-coder:1.5b',
              system = default_system,
              few_shots = default_few_shots,
              -- end_point = 'http://localhost:11434/v1/chat/completions',
              end_point = 'http://192.168.1.19:11434/v1/chat/completions',
              api_key = 'OLLAMA',
              name = 'Qwen',
              stream = true,
              optional = {
                  stop = nil,
                  max_tokens = nil,
              },
      },
      openai_fim_compatible = {
              -- model = 'starcoder2:3b',
              model = 'qwen2.5-coder:1.5b',
              system = default_system,
              few_shots = default_few_shots,
              end_point = 'http://localhost:11434/v1/completions',
              api_key = 'OLLAMA',
              name = 'Qwen',
              stream = true,
              optional = {
                  stop = nil,
                  max_tokens = nil,
              },
      }
  }
}
local config = require('minuet').config

vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
