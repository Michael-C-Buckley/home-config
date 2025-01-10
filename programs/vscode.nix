{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
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
