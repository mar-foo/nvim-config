function GrQfx(query)
	vim.cmd('cex system(\'grep -Rn '..query..' *\')')
end

-- Make functions executable in Ex mode
vim.cmd('command -nargs=* GrQfx lua GrQfx <q-args>')
