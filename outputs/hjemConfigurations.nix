{inputs, ...}: let
  mkHjemCfg = {
    modules ? [],
    nvfVer ? "default",
  }: {
    imports = [
      inputs.hjem.nixosModules.hjem
      ../flake/hjem/default.nix
    ] ++ modules;

    # I am currently only using Hjem on x86_64-linux
    hjem.linker = inputs.hjem.packages.x86_64-linux.smfh;
    users.users.michael.packages = [inputs.nvf-flake.packages.x86_64-linux.${nvfVer}];
  };
in {
  default = _: mkHjemCfg {modules = [../flake/hjem/extended.nix];};
  minimal = _: mkHjemCfg {nvfVer = "minimal";};
  wsl = _: mkHjemCfg {};
}
