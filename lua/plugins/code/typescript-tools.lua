-- typescript language server in lua
-- see https://github.com/pmizio/typescript-tools.nvim
return {
  "pmizio/typescript-tools.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig"
  },
  opts = {},
}
