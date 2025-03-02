{config, pkgs, ...}: {
  programs.vscode = {
    enable = config.features.vscode.enable;
    # package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # Utilities/General
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      ms-vscode-remote.remote-containers
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

      # Python
      ms-python.python
      ms-python.vscode-pylance
      ms-pyright.pyright

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
