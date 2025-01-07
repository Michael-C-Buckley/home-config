{ ... }:
{
  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "robbyrussell";
    plugins = [
      "sudo"
      "git"
      "docker"
      "ssh"
      "pip"
      "vscode"
      "tmux"
      "zoxide"
    ];
  };
}
