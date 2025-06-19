if not status is-interactive
    return 0
end

set fish_greeting

fish_add_path $HOME/.local/bin $PATH
fish_add_path $HOME/.cargo/bin $PATH
fish_add_path $HOME/go/bin $PATH
fish_add_path $HOME/.spicetify $PATH
fish_add_path $HOME/.deno/bin $PATH
fish_add_path "/mnt/c/Users/wiru/AppData/Local/Programs/Microsoft VS Code/bin" $PATH
fish_add_path /opt/homebrew/opt/python@3.9/bin $PATH
fish_add_path $HOME/.bun/bin

set -gx EDITOR nvim
set -gx GPG_TTY (tty)
set -gx BUN_INSTALL $HOME/.bun
set -gx PATH $BUN_INSTALL/bin $PATH
set -gx ZIG_GLOBAL_CACHE_DIR $HOME/.zig-cache
set -gx MANPAGER "nvim -c 'Man!' -o -"

set -U fish_cursor_default block

direnv hook fish | source
zoxide init fish | source
fzf --fish | source

bind \cf '~/.local/bin/tmux-sessionizer.fish'
