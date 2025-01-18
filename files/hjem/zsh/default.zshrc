# -----------------------------
# Paths and Environment
# -----------------------------

# Add custom paths to $PATH
# export PATH="$HOME/bin:$PATH"

# Set the default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Locale settings
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# -----------------------------
# Geometry Zsh Prompt
# -----------------------------

# Source the Geometry Zsh prompt
export PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
export PROMPT_GEOMETRY_EXEC_TIME=true
export GEOMETRY_TIME_NEUTRAL='yellow'
export GEOMETRY_PLUGIN_SEPARATOR=' '

export GEOMETRY_PROMPT=(geometry_status geometry_path)
export GEOMETRY_PROMPT_PLUGINS_PRIMARY=(path hostname)
export GEOMETRY_PROMPT_PLUGINS_SECONDARY=(exec_time git)
GEOMETRY_SYMBOL_PROMPT="▲"
source "$HOME/.config/resources/geometry.zsh"
export GEOMETRY_COLOR_HOSTNAME="$(geometry::hostcolor)"

# -----------------------------
# Zsh Options
# -----------------------------

# Enable common features
setopt auto_cd           # Automatically `cd` into directories
setopt auto_pushd        # Enable directory stack with `pushd`/`popd`
setopt share_history     # Share command history across Zsh sessions
setopt hist_ignore_dups  # Ignore duplicate commands in history
setopt hist_ignore_space # Ignore commands that start with a space in history
setopt extended_glob     # Enable advanced globbing

# Customize history behavior
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# -----------------------------
# Aliases
# -----------------------------

# Common aliases
alias ll='ls -alF'       # Detailed list with classification
alias la='ls -A'         # List all except `.` and `..`
alias l='ls -CF'         # Simple classified list
alias ..='cd ..'
alias ...='cd ../..'

# Git aliases
alias gst='git status'
alias gco='git checkout'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# -----------------------------
# Plugins and Frameworks
# -----------------------------

if [ -f /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# -----------------------------
# Completion
# -----------------------------

# Load completion system
autoload -Uz compinit
compinit

# Fuzzy search for completions
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ''

# -----------------------------
# Miscellaneous
# -----------------------------

# Enable color in `ls` and other commands
export CLICOLOR=1
export LSCOLORS="auto"
export DIFF_COLOR=auto
export IP_COLOR=always

# Prevent duplicate prompt display
export PROMPT_EOL_MARK=""

# Enable vi-mode for the command line
bindkey -v

echo "Welcome to Zsh, $(whoami)@$(hostname)!"

# -----------------------------
# End of File
# -----------------------------
