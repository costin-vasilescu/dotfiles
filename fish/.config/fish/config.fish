# ============================================================================
# CachyOS Fish Configuration
# ============================================================================
# Load CachyOS base configuration
source /usr/share/cachyos-fish-config/cachyos-config.fish

# ============================================================================
# Fish
# ============================================================================
function fish_greeting
    # Empty function - no greeting message or fastfetch on terminal start
end

if status is-interactive
    atuin init fish | source
end

set -g fish_key_bindings fish_vi_key_bindings

# ============================================================================
# Functions
# ============================================================================
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

function last_history_item
    echo $history[1]
end

# ============================================================================
# CLI Tools
# ============================================================================
mise activate fish | source
starship init fish | source
direnv hook fish | source
zoxide init --cmd j fish | source

# ============================================================================
# Environment Variables
# ============================================================================
set -x NVIM_APPNAME lazyvim

# Load secret environment variables
if test -f ~/.config/fish/.env.fish
    source ~/.config/fish/.env.fish
end


# ============================================================================
# Abbreviations
# ============================================================================
abbr -a !! --position anywhere --function last_history_item


# ============================================================================
# Aliases
# ============================================================================
alias cat='bat'
alias vim='nvim'
alias pip='uv pip'
alias ghget='curl -LO'
