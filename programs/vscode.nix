{config, pkgs, ...}: {
  programs.vscode = {
    enable = false;
    # enable = config.features.vscode.enable;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # Utilities/General
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      ms-vscode-remote.remote-containers
      ms-vsliveshare.vsliveshare

      
      vscode-icons-team.vscode-icons
      mechatroner.rainbow-csv
      streetsidesoftware.code-spell-checker
      formulahendry.auto-rename-tag # Matches XML tags while editting
      alefragnani.bookmarks
      redhat.ansible

      # Themes
      teabyii.ayu
      huytd.nord-light
      arcticicestudio.nord-visual-studio-code
      enkia.tokyo-night
      mvllow.rose-pine

      # Python
      ms-python.python
      ms-python.vscode-pylance
      ms-pyright.pyright
      ms-python.debugpy

      # Nix
      bbenoist.nix

      # Rust
      rust-lang.rust-analyzer

      # Go
      golang.go

      # Elixir
      elixir-lsp.vscode-elixir-ls
    ];
  };
}
