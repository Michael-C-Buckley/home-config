# Geometry project lives in this directory as it does not function properly in the nix-store
GEOMETRY_DIR="$HOME/.config/resources/geometry"

# Get Geometry if needed
if [ ! -d "$GEOMETRY_DIR" ]; then
  git clone https://github.com/geometry-zsh/geometry.git "$GEOMETRY_DIR" || {
    echo "Failed to clone geometry-zsh. Falling back to default shell settings."
    return
  }

# Apply it
if [ -f "$GEOMETRY_DIR/geometry.zsh" ]; then
  source "$GEOMETRY_DIR/geometry.zsh"
else
  echo "geometry.zsh not found in $GEOMETRY_DIR. Check the installation."
  return
fi

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
