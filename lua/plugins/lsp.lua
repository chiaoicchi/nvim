return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      local keymap = vim.keymap.set

      keymap("n", "gd", vim.lsp.buf.definition, opts)
      keymap("n", "K", vim.lsp.buf.hover, opts)
      keymap("n", "gr", vim.lsp.buf.references, opts)
      keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
      keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap("n", "[d", vim.diagnostic.goto_prev, opts)
      keymap("n", "]d", vim.diagnostic.goto_next, opts)
      keymap("n", "<leader>e", vim.diagnostic.open_float, opts)

      if client.supports_method("textDocument/formatting") then
        local group = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
        vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = group,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

    local servers = {
      rust_analyzer = {
        filetypes = { "rust" },
      },
      pyright = {},
      ts_ls = {},
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      },
      gopls = {},
      bashls = {},
      sqls = {},
      dockerls = {},
      terraformls = {},
      jsonls = {},
      yamlls = {},
      hls = {},
    }
    for server, config in pairs(servers) do
      config = vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        flags = { debounce_text_changes = 150 },
      }, config)
      lspconfig[server].setup(config)
    end
  end,
}
