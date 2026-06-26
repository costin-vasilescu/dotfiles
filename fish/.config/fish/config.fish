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
    [ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
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
abbr -a !! --position anywhere --function last_history_item

# ============================================================================
# CLI Tools
# ============================================================================
eval "$(mise activate fish)"
starship init fish | source
direnv hook fish | source

# ============================================================================
# Environment Variables
# ============================================================================
set -x NVIM_APPNAME lazyvim

# ============================================================================
# Aliases
# ============================================================================
alias cat='bat'
alias vim='nvim'
alias pip='uv pip'
alias ghget='curl -LO'
alias dfgit='git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'
alias uvml='source ~/.venvs/ml/bin/activate.fish'
