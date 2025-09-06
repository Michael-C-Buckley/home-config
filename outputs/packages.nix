{inputs, ...}: let
  mkNvf = extraModules:
    (inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [../flake/packages/nvf] ++ extraModules;
    }).neovim;
in {
  perSystem = {pkgs, ...}: {
    ns = pkgs.callPackage ../flake/packages/ns.nix {};

    nvf = mkNvf [../flake/packages/nvf/extended.nix];
    nvf-minimal = mkNvf [];
  };
}