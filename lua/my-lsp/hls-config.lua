function Ghci()
	vim.cmd('vsplit')
	local dirname = vim.fn.expand('%:p:h:t')
	if dirname == 'app' or dirname == 'src' then
		vim.cmd('term cabal v2-repl')
	else
		vim.cmd('term ghci')
	end
end

require('lspconfig')["hls"].setup {
	settings = {
		haskell = {
			formattingProvider = "hindent",
		},
	},
	on_attach = function(client, bufnr)
		require('my-lsp.lsp-config')(client, bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-l>', '<cmd>lua Ghci()<CR>', {noremap = true, silent = true})
	end,
}
