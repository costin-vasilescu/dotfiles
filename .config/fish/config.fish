# ============================================================================
# CachyOS Fish Configuration
# ============================================================================
# Load CachyOS base configuration
source /usr/share/cachyos-fish-config/cachyos-config.fish

# ============================================================================
# Greeting
# ============================================================================
function fish_greeting
    # Empty function - no greeting message or fastfetch on terminal start
end

# ============================================================================
# Prompt
# ============================================================================
starship init fish | source

# ============================================================================
# Key Bindings
# ============================================================================
set -g fish_key_bindings fish_vi_key_bindings

# ============================================================================
# External Tools
# ============================================================================
# Autojump - fast directory navigation
[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
# Mise - polyglot runtime manager
eval "$(mise activate fish)"

# ============================================================================
# Environment Variables
# ============================================================================
set -x NVIM_APPNAME lazyvim

# ============================================================================
# Aliases
# ============================================================================
alias cat='bat'
alias vim='nvim'
alias dfgit='git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'
alias uvml='source ~/.venvs/ml/bin/activate.fish'
