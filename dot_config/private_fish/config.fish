# Fish config

# Source global Fish configuration (if applicable)
if test -f /etc/fish/config.fish
    source /etc/fish/config.fish
end

# User-specific PATH modification
if not string match -q "*$HOME/.local/bin:$HOME/bin*" $PATH
    set -x PATH $HOME/.local/bin $HOME/bin $PATH
end

# Disable systemctl auto-paging (if desired)
# set -x SYSTEMD_PAGER ""

# Source Fish scripts from ~/.bashrc.d equivalent
if test -d ~/.bashrc.d
    for rc in ~/.bashrc.d/*
        if test -f $rc
            source $rc
        end
    end
end

# Start SSH agent and add key
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c)
end

# Homebrew package manager initialization
if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# Initialize zoxide
if type -q zoxide
    zoxide init fish | source
end

# Initialize starship prompt
if type -q starship
    starship init fish | source
end

# Default editor
set -x EDITOR (which vim)

# Add Doom Emacs to PATH
set -x PATH $PATH $HOME/.config/emacs/bin

# Aliases
alias cat="bat"
alias cd="z"
alias ls="lsd"

