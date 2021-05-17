-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Install Packer if not installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = '/home/mario/.config/nvim/pack/packer/start'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- LSP
    use 'neovim/nvim-lspconfig' -- LSP configuration
    use { 'hrsh7th/nvim-compe',
        requires = { 'hrsh7th/vim-vsnip', 'rafamadriz/friendly-snippets', 'hrsh7th/vim-vsnip-integ' }
    } -- Code completion
    use 'b3nj5m1n/kommentary' -- Insert comments easily
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use_rocks {
        'lua-format',
        opt = true
        } -- Formatting for lua language server
    -- Theme
    use {'dracula/vim', as = 'dracula', opt = true}
    use {
        'vim-airline/vim-airline-themes',  event = 'VimEnter',
        requires = {'vim-airline/vim-airline',  event = 'VimEnter'},
        config = 'vim.cmd[[AirlineTheme gruvbox]]'
    }
    use 'glepnir/dashboard-nvim'
    use {'dylanaraps/wal.vim', opt = true, config = 'vim.cmd[[colorscheme wal]]'} -- Pywal colorscheme
    use { 'gruvbox-community/gruvbox',
    	config = { 'vim.cmd[[colorscheme gruvbox]]', 'vim.cmd[[highlight Normal ctermbg=none]]' }
    }
    use 'ap/vim-css-color'
    -- Miscellaneous
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons'},
        cmd = { 'Telescope find_files', 'Telescope live_grep' },
        config = function() require('my-plugins.telescope') end
    }
    use {
        'nvim-telescope/telescope-fzy-native.nvim',
	cmd = { 'Telescope find_files', 'Telescope live_grep' }
        }
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    use { 'junegunn/fzf', run = function() vim.cmd[[fzf#install()]] end }
    use 'junegunn/fzf.vim'
end)
