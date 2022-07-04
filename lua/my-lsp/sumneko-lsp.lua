-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/lua-language-server"

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

return sumneko_root_path
