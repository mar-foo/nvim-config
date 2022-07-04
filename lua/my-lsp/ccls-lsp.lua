local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['ccls'].setup {
	capabilities = capabilities,
	on_attach = require('my-lsp.lsp-config')
}
