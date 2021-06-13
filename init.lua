-- Package management
require('plugins')

-- General configuration
require('general.settings')
require('general.mappings')
require('general.netrw')

-- Theme
require('theme.airline')

-- Lsp
require('my-lsp.treesitter-config')
require('my-lsp.lsp-config')
require('my-lsp.bashls-lsp')
require('my-lsp.clangd-lsp')
require('my-lsp.sumneko-lsp')
require('my-lsp.texlab-lsp')
require('my-lsp.gopls-lsp')
require('my-lsp.compe-config')

-- Plugin configuration
-- require('my-plugins.telescope')
require('my-plugins.dashboard')
require('my-plugins.kommentary')
