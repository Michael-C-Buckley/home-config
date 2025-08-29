{inputs, ...}: let
  mkHjemCfg = {
    modules ? [],
    nvfVer ? "default",
  }: {
    imports = [../flake/hjem/default.nix] ++ modules;
    # I am currently only using Hjem on x86_64-linux
    users.users.michael.packages = [inputs.nvf-flake.packages.x86_64-linux.${nvfVer}];
  };
in {
  default = _: mkHjemCfg {modules = [../flake/hjem/extended.nix];};
  minimal = _: mkHjemCfg {nvfVer = "minimal";};
  wsl = _: mkHjemCfg {};
}
