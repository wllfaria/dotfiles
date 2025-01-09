fnm env --json | from json | load-env

$env.PATH = (
    $env.PATH
    | split row (char esep)
    | append ([$env.FNM_MULTISHELL_PATH "bin"] | path join)
)
