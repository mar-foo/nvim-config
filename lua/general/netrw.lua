-- Netrw
--------------------
vim.g.netrw_banner=0
vim.g.netrw_liststyle=3
vim.g.netrw_winsize=30

-- https://stackoverflow.com/questions/11201262/how-to-read-data-from-a-file-in-lua
function fileExists(file)
  local f = io.open(file, "r")
  if f then f:close() end
  return f ~= nil
end

function gitignore()
  local file = '.gitignore'
  if not fileExists(file) then return '' end
  lines = ''
  for line in io.lines(file) do
    lines = lines .. line .. ','
  end
  return lines
end

-- Ignore the .git folder and everything that is in the .gitignore file if it
-- exists
local fileIgnore = '.git,' .. gitignore()
vim.g.netrw_list_hide=fileIgnore
