return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local nvim_lsp = require("lspconfig")

      nvim_lsp.tailwindcss.setup({
        cmd = { "tailwindcss-language-server", "--stdio" },
        ft = { "html", "elixir", "eelixir", "heex" },
        root_dir = nvim_lsp.util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.ts",
          "package.json",
          "node_modules",
          ".git",
          "mix.exs"
        ),
        -- init_options = {
        --   userLanguages = {
        --     elixir = "html-eex",
        --     eelixir = "html-eex",
        --     heex = "html-eex",
        --   },
        -- },
        settings = {
          tailwindCSS = {
            includeLanguages = {
              elixir = "html-eex",
              eelixir = "html-eex",
              heex = "html-eex",
            },
            experimental = {
              classRegex = {
                'class[:]\\s*"([^"]*)"',
              },
            },
          },
        },
      })
    end,
  },
}
