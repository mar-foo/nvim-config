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
  -- Code completion
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}

  -- Insert comments easily
  use 'b3nj5m1n/kommentary'
  -- Golang integration
  use {'fatih/vim-go', ft = 'go'}

  -- Theme
  use {'aditya-azad/candle-grey'}

  -- FZF
  use {'junegunn/fzf', run = function() vim.cmd[[fzf#install()]] end}
  use 'junegunn/fzf.vim'
	--
  -- Git
  use 'tpope/vim-fugitive'
end)
