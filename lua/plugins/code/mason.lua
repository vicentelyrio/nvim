local m_status_ok, mason = pcall(require, 'mason')
if not m_status_ok then return end

local ml_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ml_status_ok then return end

local l_status_ok, lspconfig = pcall(require, 'lspconfig')
if not l_status_ok then return end

local servers = {
	'bashls',
	'jsonls',
	'yamlls',
	'cssls',
	'cssmodules_ls',
	'tsserver',
	'eslint',
	'html',
	'lua_ls',
	'marksman',
}

mason.setup()

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

mason_lspconfig.setup_handlers {
  function (server_name)
    lspconfig[server_name].setup {}
  end,
}

local opts = {}

for _, server in pairs(servers) do
	server = vim.split(server, '@')[1]

	--[[ opts = { ]]
	--[[ 	on_attach = require('user.plugins.lsp.handlers').on_attach, ]]
	--[[ 	capabilities = require('user.plugins.lsp.handlers').capabilities, ]]
	--[[ } ]]

	local require_ok, conf_opts = pcall(require, 'plugins.lsp.settings.' .. server)

	if require_ok then
		opts = vim.tbl_deep_extend('force', conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end

