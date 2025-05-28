#!/usr/bin/env fish

set session (find ~/code ~/dotfiles ~/work -mindepth 1 -maxdepth 1 -type d | fzf)
set session_name (basename $session | string replace -a '.' '_')

if not tmux has-session -t $session_name ^/dev/null
    tmux new-session -d -s $session_name -c $session
end

if not set -q TMUX
    tmux attach-session -t $session_name
else
    tmux switch-client -t $session_name
end

