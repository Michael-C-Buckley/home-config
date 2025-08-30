{inputs, ...}: let
  mkHjemCfg = {
    modules ? [],
    nvfVer ? "default",
  }: {
    imports =
      [
        inputs.hjem.nixosModules.hjem
        ../flake/hjem/default.nix
      ]
      ++ modules;

    # I am currently only using Hjem on x86_64-linux
    hjem.linker = inputs.hjem.packages.x86_64-linux.smfh;
    users.users.michael.packages = [inputs.nvf-flake.packages.x86_64-linux.${nvfVer}];
  };
in {
  # Full Graphical Environment configs
  default = _: mkHjemCfg {modules = [../flake/hjem/extended.nix];};

  # Stripped bare, suitable for cloud or VMs
  minimal = _: mkHjemCfg {nvfVer = "minimal";};

  # Bare metal servers, slightly above the stripped including a few extras
  server = _:
    mkHjemCfg {
      nvfVer = "minimal";
      modules = [../flake/hjem/server.nix];
    };

  # As name implies
  wsl = _: mkHjemCfg {};
}
