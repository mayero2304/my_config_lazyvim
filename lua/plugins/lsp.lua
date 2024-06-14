-- return {
--   "neovim/nvim-lspconfig",
--   dependencies = {
--     -- "jose-elias-alvarez/null-ls.nvim",
--     {
--       "williamboman/mason.nvim",
--       opts = {
--         ui = {
--           border = "rounded",
--         },
--       },
--     },
--     "folke/neodev.nvim",
--     "williamboman/mason-lspconfig.nvim",
--     "WhoIsSethDaniel/mason-tool-installer.nvim",
--   },
--   event = "VeryLazy",
--   main = "alpha.lsp",
--   opts = {
--     mason = {
--       enable = true,
--       auto_install = false,
--     },
--     servers = {
--       phpactor = { enable = true },
--       volar = {
--         enable = true,
--         filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
--         -- Otras opciones específicas de Volar si las necesitas
--       },
--       vtsls = {},
--     },
--   },
-- }
--
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    table.insert(opts.servers.vtsls.filetypes, "vue")
    LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
      {
        name = "@vue/typescript-plugin",
        location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
        languages = { "vue" },
        configNamespace = "typescript",
        enableForWorkspaceTypeScriptVersions = true,
      },
    })
  end,
}
