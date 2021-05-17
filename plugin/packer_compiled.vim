" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/mario/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/mario/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/mario/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/mario/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/mario/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  dracula = {
    after_files = { "/home/mario/.local/share/nvim/site/pack/packer/opt/dracula/after/plugin/dracula.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/mario/.local/share/nvim/site/pack/packer/opt/dracula"
  },
  firenvim = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  gruvbox = {
    config = { "vim.cmd[[colorscheme gruvbox]]", "vim.cmd[[highlight Normal ctermbg=none]]" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  kommentary = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    commands = { "Telescope find_files", "Telescope live_grep" },
    loaded = false,
    needs_bufread = false,
    path = "/home/mario/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope find_files", "Telescope live_grep" },
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25my-plugins.telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/mario/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    config = { "vim.cmd[[AirlineTheme gruvbox]]" },
    loaded = false,
    needs_bufread = false,
    path = "/home/mario/.local/share/nvim/site/pack/packer/opt/vim-airline-themes"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["wal.vim"] = {
    config = { "vim.cmd[[colorscheme wal]]" },
    loaded = false,
    needs_bufread = false,
    path = "/home/mario/.local/share/nvim/site/pack/packer/opt/wal.vim"
  }
}

time("Defining packer_plugins", false)
-- Config for: gruvbox
time("Config for gruvbox", true)
vim.cmd[[colorscheme gruvbox]]
vim.cmd[[highlight Normal ctermbg=none]]
time("Config for gruvbox", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope find_files lua require("packer.load")({'telescope.nvim', 'telescope-fzy-native.nvim'}, { cmd = "Telescope find_files", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope live_grep lua require("packer.load")({'telescope.nvim', 'telescope-fzy-native.nvim'}, { cmd = "Telescope live_grep", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time("Defining lazy-load event autocommands", true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-airline-themes'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time("Defining lazy-load event autocommands", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
