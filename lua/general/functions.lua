function GrQfx(query)
	vim.cmd('cex system(\'grep -Rn '..query..' *\')')
end

-- Make functions executable in Ex mode
vim.cmd('command! -bang -nargs=* Grep call fzf#vim#grep("grep -n -R ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)')
vim.cmd('command -nargs=* GrQfx lua GrQfx <q-args>')
