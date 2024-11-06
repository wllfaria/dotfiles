$env.config = {
    show_banner: false
}

$env.CARGO_HOME = ($env.HOME | path join .cargo)

$env.PATH = (
    $env.PATH 
    | split row (char esep) 
    | append ($env.CARGO_HOME | path join bin)
    | append ($env.HOME | path join .local bin)
    | append ($env.HOME | path join .spicetify)
)

alias ll = ls -l
alias paru = paru --bottomup --skipreview
alias v = nvim

def proj [] {
    source ~/dotfiles/tmux-sessionizer.nu
}
