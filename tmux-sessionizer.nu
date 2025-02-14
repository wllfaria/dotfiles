let paths = [
    "/Users/wiru/code",
    "/Users/wiru/work",
    "/Users/wiru/dotfiles",
]

mut path = ""

if (which fd | is-empty) {
    $path = ^find ...$paths `-mindepth` 1 `-maxdepth` 2 `-type` d | fzf
} else {
    $path = ^fd . ...$paths --min-depth 1 --max-depth 2 --type d | fzf
}

if ($path | is-empty) {
    exit 0
}

let session_name = $path 
    | path basename
    | str replace --all '.' '_'
    | str replace --all '/' '_'


if (tmux has-session -t "$session_name") {
    tmux new-session -d -s "$session_name" -c "$session"
fi

if ($env.TMUX? | is-empty) {
    cd $path
    zellij a $session_name -c
    exit 0
}

let plugin_url = "https://github.com/wllfaria/zellij-switch/releases/download/release/zellij-switch.wasm"

zellij pipe --plugin $plugin_url -- $"--session ($session_name) --cwd ($path)"
