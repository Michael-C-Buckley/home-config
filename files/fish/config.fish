if status is-interactive
  # Starship
  function starship_transient_prompt_func
    starship module character
  end
  starship init fish | source
  enable_transience

  source ~/.config/shells/aliases.sh
  source ~/.config/shells/environment.sh
end