{ platform, ... }: let

myShellAliases = {
  ll = "ls -l";
  ".." = "cd ..";
  ip = "ip --color=auto";
  z = "zoxide";
  k = "kubectl";
  gs = "git status";
};

gitAliases = {
  pu = "push";
  co = "checkout";
  cm = "commit";
  f = "fetch";
  fb = "fetch --rebase";
};

graphicImports = [
  ./vscode.nix
  ./waybar/default.nix
];

in {

  imports = [ ./nushell.nix ]
  ++ (if (platform != "server") then graphicImports else [] );

  programs = {
    nushell.shellAliases = myShellAliases;
    zsh.shellAliases = myShellAliases;
    bash.shellAliases = myShellAliases;
    fish.shellAliases = myShellAliases;

    carapace.enable = true;

    starship = {
      enable = true;
      settings = {
        add_newline = true;
        character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
        };
      };
    };

    git = {
      enable = true;
      userName = "Michael Buckley";
      userEmail = "michaelcbuckley@proton.me";
      aliases = gitAliases;
    };
  };
}
