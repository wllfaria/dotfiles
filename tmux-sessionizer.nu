#!/usr/bin/env nu

let session = ls ~/code  ~/dotfiles 
    | sort-by --reverse modified
    | get name
    | flatten
    | to text
    | fzf

let session_name = $session 
    | path basename 
    | str replace '.' '_'

if (tmux has-session -t $session_name | is-empty) {
    tmux new-session -d -s $session_name -c $session
}

if (try { $env.TMUX }; '' | is-empty) {
    tmux attach-session -t $session_name
} else {
    tmux switch-client -t $session_name
}
