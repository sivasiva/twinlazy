return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local nvim_lsp = require("lspconfig")
      local util = nvim_lsp.util

      local root_pattern = nvim_lsp.util.root_pattern

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
        init_options = {
          userLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
          },
        },
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                'class[:]\\s*"([^"]*)"',
              },
            },
          },
        },
        -- root_dir = util.root_pattern("tailwind.config.js", ".git"),
        -- root_dir = root_pattern(
        --   -- "assets/tailwind.config.js",
        --   "tailwind.config.js",
        --   "tailwind.config.ts",
        --   "postcss.config.js",
        --   "postcss.config.ts",
        --   "package.json",
        --   "node_modules"
        -- ),
      })
    end,
  },
}
