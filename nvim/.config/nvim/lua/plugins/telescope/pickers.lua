local bottom_layout = {
    results_title = "",
    sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
    borderchars = {
        prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
        results = { " " },
    },
}

return {
    find_files = bottom_layout,
    git_files = bottom_layout,
    buffers = bottom_layout,
    help_tags = bottom_layout,
}
