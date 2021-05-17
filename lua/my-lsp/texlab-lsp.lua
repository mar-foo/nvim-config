require'lspconfig'.texlab.setup{
    cmd = { "texlab" },
    filetypes = { "tex", "bib" },
    settings = {
        bibtex =  {
            formatting = {
                lineLenght = 120
            }
        },
        latex = {
            build = {
                args = { "-interaction=nonstopmode", "-synctex=1", "%f" },
                executable = "pdflatex",
                onSave = false
            },
            forwardSearch = {
                executable = 'zathura',
                args = { '%p' },
                onSave = false
            },
            lint = {
                onChange = false
            }
        }
    }
}
