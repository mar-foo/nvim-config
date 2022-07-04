local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local rep = require('luasnip.extras').rep

ls.config.set_config = {
	history = true,
	updateevents = 'TextChanged, TextChangedI',
	enable_autosnippets = false,
}

vim.keymap.set({'i', 's'}, '<C-j>', function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, {noremap = true, silent = true})

vim.keymap.set({'i', 's'}, '<C-e>', function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, {noremap = true, silent = true})

vim.keymap.set({'i', 's'}, '<C-l>', function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {noremap = true, silent = true})

ls.add_snippets("lua", {
	s("req", {
		t("local "), i(1, "req"), t(" = require('"), rep(1), t("')")
	})
})
ls.add_snippets("c", {
	s("test", fmt([[
START_TEST({})
{{
	{}
}}
END_TEST]],
		{i(1, 'i'), i(0)})),
})

