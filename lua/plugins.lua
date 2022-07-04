-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Install Packer if not installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = '/home/mario/.local/share/nvim/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end

-- Plugins
return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- LSP configuration
	use 'neovim/nvim-lspconfig'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	--
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use {'sakhnik/nvim-gdb', run = './install.sh'}
	-- Code completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use {'saadparwaiz1/cmp_luasnip', requires = 'L3MON4D3/LuaSnip'}

	-- Insert comments easily
	use 'b3nj5m1n/kommentary'
	-- Golang integration
	use {'fatih/vim-go', ft = 'go'}

	-- Theme
	use { 'NTBBloodbath/galaxyline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
	use 'aditya-azad/candle-grey'
	use 'romgrk/doom-one.vim'

	-- Git
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

	use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim' }}}
	use {'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
end)
