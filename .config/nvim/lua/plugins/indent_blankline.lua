require("indent_blankline").setup {
    space_char_blankline = " ",
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    buftype_exclude = { "terminal" },
    filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
        "packer",
        "lsp-installer",
        "lspinfo",
        "vista_kind"
    },
}

