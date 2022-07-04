local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_on_attach =  function(_, bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true}
	vim.keymap.set('n', 'gd',  require('telescope.builtin').lsp_definitions, opts)
	vim.keymap.set('n', 'gD',  vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gr',  require('telescope.builtin').lsp_references, opts)
	vim.keymap.set('n', 'gR',  vim.lsp.buf.rename, opts)
	vim.keymap.set('n', 'gi',  require('telescope.builtin').lsp_implementations, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<C-n>',  vim.diagnostic.setqflist, opts)
	vim.keymap.set('i', '<C-o>',  vim.lsp.buf.signature_help, opts)
end

-- Rust
require('lspconfig')['rust_analyzer'].setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		lsp_on_attach(client, bufnr)
		vim.opt.makeprg = 'cargo build'
	end
}

-- C/C++
require('lspconfig')['ccls'].setup {
	capabilities = capabilities,
	on_attach = lsp_on_attach
}

-- Lua
local sumneko_root_path = require('my-lsp.sumneko-lsp')
local sumneko_binary = sumneko_root_path .. '/bin/lua-language-server'
require('lspconfig').sumneko_lua.setup {
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/bin/main.lua"},
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = vim.split(package.path, ';')
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'}
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
			},
			telemetry = {
				enable = false,
			}
		}
	},
	on_attach = lsp_on_attach
}


-- Go
require('my-lsp.gopls-lsp')
require('lspconfig')['gopls'].setup {
	capabilities = capabilities,
	cmd = {"gopls", "serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
	on_attach = lsp_on_attach,
}

-- Haskell
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
		lsp_on_attach(client, bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-l>', '<cmd>lua Ghci()<CR>', {noremap = true, silent = true})
	end,
}
