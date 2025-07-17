return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { "williamboman/mason.nvim", commit = "4da89f3" },
      { "williamboman/mason-lspconfig.nvim", commit = "1a31f82" },
    },
    config = function()
      local lspconfig = require('lspconfig')
      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap
      vim.lsp.set_log_level("error")
      keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
      keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

      local on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      local lsp_flags = {
        debounce_text_changes = 150,
      }

      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "yamlls",
          "cssls",
          "html",
          "lua_ls",
          "rust_analyzer",
          "volar",
          "vue-language-server",
          "ts_ls",
          "solidity",
          "eslint",
          "tailwindcss",
        },
        automatic_installation = true,
      })

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            flags = lsp_flags,
          })
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            on_attach = on_attach,
            flags = lsp_flags,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  },
                },
              },
            },
          })
        end,
        
        ["ts_ls"] = function()
          local mason_registry = require("mason-registry")
          local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
          .. "/node_modules/@vue/language-server"

          lspconfig.ts_ls.setup({
            on_attach = on_attach,
            flags = lsp_flags,
            filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },
            cmd = { "typescript-language-server", "--stdio" },
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = vue_language_server_path,
                        languages = { "vue" },
                    },
                },
            },
          })
        end,
        ["volar"] = function()
          lspconfig.volar.setup({
            on_attach = on_attach,
            flags = lsp_flags,
            init_options = {
              typescript = {
                tsdk = vim.fn.getcwd() .. '/node_modules/typescript/lib'
              }
            }
          })
        end,
        ["eslint"] = function()
          lspconfig.eslint.setup({
            on_attach = function(client, bufnr)
              on_attach(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({
                    filter = function(c)
                      return c.name == "eslint"
                    end,
                    bufnr = bufnr,
                  })
                end,
              })
            end,
            filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
          })
        end,
        ["tailwindcss"] = function()
          lspconfig.tailwindcss.setup({
            on_attach = on_attach,
            flags = lsp_flags,
            filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascriptreact", "reason", "rescript", "typescriptreact", "vue", "svelte", "templ" },
            cmd = { "tailwindcss-language-server", "--stdio" },
          })
        end,
      })
    end
  }
}