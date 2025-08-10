if [[ -r "$HOME/.opam/opam-init/init.sh" ]]; then
  source "$HOME/.opam/opam-init/init.sh" > /dev/null 2>&1
fi

set -o emacs
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'
bind -x '"\C-f": "$HOME/.local/bin/tmux-sessionizer"'

HISTSIZE=5000
HISTFILE=~/.bash_history
SAVEHIST=$HISTSIZE
HISTGDUP=erase

export EDITOR="nvim"
export GPG_TTY=$(tty)
export MANPAGER="nvim -c 'Man!' -o -"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"

alias ls="eza --icons=always"
alias paru="paru --bottomup --skipreview"
alias v="nvim"
alias l="ls -l"
alias cd="z"

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi

if command -v fzf &>/dev/null; then
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

if [ -s "/home/wiru/.bun/_bun" ]; then
  source "/home/wiru/.bun/_bun"
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
alias claude="$HOME/.claude/local/claude"

prompt() {
    local green="\[\e[32m\]"
    local yellow="\[\e[33m\]"
    local magenta="\[\e[35m\]"
    local reset="\[\e[0m\]"

    PS1="${green}@\u${reset} "
    PS1="${PS1}${yellow}\W${reset} "

    if ! git_loc="$(type -p "$git_command_name")" || [ -z "$git_loc" ]; then
		if [ -d .git ] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
			PS1="${PS1}${green}in $(git symbolic-ref --short HEAD)${reset} "
		fi
	fi

    PS1="${PS1}${magenta}~>${reset} "
}

PROMPT_COMMAND=prompt
