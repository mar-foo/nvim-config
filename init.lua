-- General configuration
require('general.settings') -- Global settings I want everywhere
require('general.mappings') -- Define keymappings
require('general.netrw') -- Simple netrw configuration

-- Package management
require('plugins') -- Use Packer.nvim to manage plugins

-- Theme
require('theme.airline') -- Airline

-- Lsp
require('my-lsp.treesitter-config') -- Treesitter parsing
require('my-lsp.lsp-config') -- Default LSP config
require('my-lsp.bashls-lsp') -- Bash LSP
require('my-lsp.clangd-lsp') -- C/C++ LSP
require('my-lsp.sumneko-lsp') -- Lua LSP
require('my-lsp.texlab-lsp') -- Texlive/Latex LSP
require('my-lsp.gopls-lsp') -- Golang LSP
require('my-lsp.compe-config') -- Completion

-- Plugin configuration
-- require('my-plugins.telescope') -- Telescope
require('my-plugins.dashboard') -- Dashboard
require('my-plugins.kommentary') -- Easy comments
