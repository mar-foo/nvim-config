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
    -- LSP configuration
  use 'neovim/nvim-lspconfig'
    -- Code completion
  use { 'hrsh7th/nvim-compe',
    requires = { 'hrsh7th/vim-vsnip', 'rafamadriz/friendly-snippets',
      'hrsh7th/vim-vsnip-integ' }
  }
    -- Insert comments easily
  use 'b3nj5m1n/kommentary'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'p00f/nvim-ts-rainbow', requires = {'nvim-treesitter/nvim-treesitter'}}
    -- Formatting for lua language server
  use_rocks {
    'lua-format',
    opt = true
  }
    -- Golang integration
  use 'fatih/vim-go'

  -- Editing
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use { 'rhysd/clever-f.vim', config = function()
  vim.g.clever_f_smart_case = 1
  vim.g.clever_f_chars_match_any_signs = ';'
  end}
  use {'bkad/CamelCaseMotion', config = function()
  vim.g.camelcasemotion_key = ''
  end}
  use { 'machakann/vim-highlightedyank', config = function()
  vim.g.highlightedyank_highlight_duration = 100
  end}

  -- Theme
  use {'dracula/vim', as = 'dracula', opt = true}
  use {
    'vim-airline/vim-airline-themes',  event = 'VimEnter',
    requires = {'vim-airline/vim-airline',  event = 'VimEnter'},
    config = 'vim.cmd[[AirlineTheme gruvbox]]'
  }
  use 'glepnir/dashboard-nvim'
  use {'dylanaraps/wal.vim', opt = true, config = 'vim.cmd[[colorscheme wal]]'} -- Pywal colorscheme
    -- Gruvbox
  use { 'gruvbox-community/gruvbox',
    config = { 'vim.cmd[[colorscheme gruvbox]]', 'vim.cmd[[highlight Normal ctermbg=none]]' }
  }
  use 'ap/vim-css-color'

  -- Miscellaneous
    -- Telescope
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
end)
