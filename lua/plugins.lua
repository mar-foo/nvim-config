-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Install Packer if not installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = '/home/mario/.local/share/nvim/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- LSP
    -- LSP configuration
  use 'neovim/nvim-lspconfig'
    -- Code completion
  use { 'hrsh7th/nvim-compe'}
    -- Insert comments easily
  use 'b3nj5m1n/kommentary'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- Formatting for lua language server
  use_rocks { 'lua-format', opt = true, ft = 'lua' }
    -- Golang integration
  use {'fatih/vim-go', ft = 'go' }
  use {'SirVer/ultisnips'}

  -- Editing
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use { 'rhysd/clever-f.vim', config = function()
  vim.g.clever_f_smart_case = 1
  vim.g.clever_f_chars_match_any_signs = ';'
  end}
  use {'bkad/CamelCaseMotion', config = function()
  vim.g.camelcasemotion_key = ''
  end, ft = { 'go', 'c' }}
  use { 'machakann/vim-highlightedyank', config = function()
  vim.g.highlightedyank_highlight_duration = 100
  end}

  -- Theme
  use {'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
  }
  use 'morhetz/gruvbox'
  use 'ap/vim-css-color'

  -- Miscellaneous
    -- Firenvim
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    -- FZF
  use { 'junegunn/fzf', run = function() vim.cmd[[fzf#install()]] end,
    config = function() vim.api.nvim_set_keymap('n', '<c-x>', ':FZF<cr>', {noremap = true })
      vim.api.nvim_set_keymap('n', 'g/', ':Rg<cr>', {noremap = true}) end}
  use 'junegunn/fzf.vim'
    -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
    -- Training
  use 'ThePrimeagen/Vim-Be-Good'
end)
