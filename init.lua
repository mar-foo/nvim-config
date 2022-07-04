-- General configuration
require('general.settings') -- Global settings I want everywhere
require('general.functions') -- Custom functions
require('general.mappings') -- Keymappings
require('general.netrw') -- Netrw

-- Package management
require('plugins') -- Use Packer.nvim to manage plugins

-- Theme
require('theme.theme') -- Color theme

-- Lsp
require('my-lsp.treesitter-config') -- Treesitter parsing
require('my-lsp.cmp-config')
require('my-plugins.luasnip')
require('my-lsp.lsp-config')

-- Plugin configuration
require('my-plugins.kommentary') -- Easy comments
require('my-plugins.neogit') -- Magit
