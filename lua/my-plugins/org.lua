require('orgmode').setup({
	org_agenda_files = {"~/doc/pers/org/*"},
	org_default_notes_file = "~/doc/pers/org/inbox.org",
	org_todo_keywords = {'TODO(t)', 'NEXT(n)', 'WAITING(w)', '|', 'DONE(d)', 'NO(n)'},
	org_capture_templates = {
		i = {
			description = 'Inbox',
			target = '~/doc/pers/org/inbox.org',
			template = '* TODO %?\n/Entered on/ %U'
		},
		m = {
			description = 'Meeting',
			target = '~/doc/pers/org/agenda.org',
			template = '* %? :meeting:\n<%<%Y-%m-%d %a %H:%M>>'
		}
	},
	org_agenda_skip_scheduled_if_done = true,
	org_agenda_skip_deadline_if_done = true
})
