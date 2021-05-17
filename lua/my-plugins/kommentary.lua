require('kommentary.config').configure_language('default', {
prefer_multi_line_comments = true,
use_consistent_indenation = true,
ignore_whitespace = true
})

require('kommentary.config').configure_language('lua', {
prefer_single_line_comments = true,
use_consistent_indentation = true,
ignore_whitespace = true
})
