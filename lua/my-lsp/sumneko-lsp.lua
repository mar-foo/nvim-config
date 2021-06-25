-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"

-- Install lua language server if not installed (inspired by https://github.com/wbthomason/packer.nvim)
if vim.fn.empty(vim.fn.glob(sumneko_root_path)) > 0 then
    local fn = vim.fn
    fn.system({'git', 'clone', 'https://github.com/sumneko/lua-language-server', sumneko_root_path})
    fn.system({'cd', sumneko_root_path})
    fn.system({'git', 'submodule', 'update', '--init', '--recursive'})
    fn.system({'cd', '3rd/luamake'})
    fn.system({'compile/install.sh'})
    fn.system({'cd', '../..'})
    fn.system({'./3rd/luamake/luamake', 'rebuild'})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    },
}

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
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
            }
        }
    }
}
