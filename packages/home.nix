# Home-manager user packages
{pkgs, ...}: {
    home.packages = (import ./common.nix {inherit pkgs;});
}