-- General configuration
require('general.settings') -- Global settings I want everywhere
require('general.functions') -- Custom functions
require('general.mappings') -- Keymappings
require('general.netrw') -- Netrw

-- Package management
require('plugins') -- Use Packer.nvim to manage plugins

-- Theme
require('theme.theme') -- Color theme
require('theme.evil-lualine') -- Lualine

-- Lsp
require('my-lsp.treesitter-config') -- Treesitter parsing
require('my-lsp.lsp-config') -- Default LSP config
require('my-lsp.bashls-lsp') -- Bash LSP
require('lspconfig').ccls.setup{} -- C/C++ LSP
require('my-lsp.sumneko-lsp') -- Lua LSP
require('my-lsp.texlab-lsp') -- Texlive/Latex LSP
require('my-lsp.gopls-lsp') -- Golang LSP
require('my-lsp.compe-config') -- Completion

-- Plugin configuration
require('my-plugins.kommentary') -- Easy comments
