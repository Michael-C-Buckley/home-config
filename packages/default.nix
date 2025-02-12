{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    tig
    lla
    curl
    wget
    bat
    killall
    du-dust
    atop
    btop
    fd
    fzf
    zoxide

    # Bash Line Editor - for Starship transient prompt
    blesh
  ];
}
