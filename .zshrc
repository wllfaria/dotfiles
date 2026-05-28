[[ ! -r '$HOME/.opam/opam-init/init.zsh' ]] || source '$HOME/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

bindkey -e
bindkey '^p' history-search-backward
bindkey '^p' history-search-forward
bindkey -s '^f' "$HOME/.local/bin/tmux-sessionizer\n"

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTGDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

export XDG_CONFIG_HOME="$HOME/.config"
export EMACSDIR="$XDG_CONFIG_HOME/emacs"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.spicetify:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="/mnt/c/Users/wiru/AppData/Local/Programs/Microsoft VS Code/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.9/bin:$PATH"
export EDITOR="nvim"
export GPG_TTY=$(tty)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export ZIG_GLOBAL_CACHE_DIR="$HOME/.zig-cache"

alias ls="eza --icons=always"
alias paru="paru --bottomup --skipreview"
alias v="nvim"
alias l="ls -l"

eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

export PATH="$PATH:$HOME/.cache/lm-studio/bin"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

prompt() {
    local green="%F{green}"
    local yellow="%F{yellow}"
    local magenta="%F{magenta}"
    local reset="%f"

    PS1="${green}@\u${reset} "
    PS1="${PS1}${yellow}\W${reset} "

    if ! git_loc="$(type -p "$git_command_name")" || [ -z "$git_loc" ]; then
		if [ -d .git ] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
			PS1="${PS1}${green}in $(git symbolic-ref --short HEAD)${reset} "
		fi
	fi

    PS1="${PS1}${magenta}~>${reset} "
}

function prompt() {
    local green="%F{green}"
    local yellow="%F{yellow}"
    local magenta="%F{magenta}"
    local reset="%f"

    local prompt_text="${green}@%n${reset} "
    prompt_text+="${yellow}%1~${reset} "

    # Check if inside a git repo and get branch
    if command -v git &>/dev/null; then
        if git rev-parse --is-inside-work-tree &>/dev/null; then
            local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
            prompt_text+="${green}in ${branch}${reset} "
        fi
    fi

    prompt_text+="${magenta}~>${reset} "

    PROMPT="${prompt_text}"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt
