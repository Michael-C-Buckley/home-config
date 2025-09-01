# Split into per-host basis
{
  pkgs,
  lib,
  ...
}: let
  getPkgs = file: (import ../packageSets/${file}.nix {inherit pkgs;});
  inherit (lib) concatMap;
in {
  users.users.michael = {
    packages = concatMap getPkgs ["extendedGraphical" "minimalGraphical" "linuxDesktop"];
  };

  # hjem = {
  #   extraModules = [
  #     ./modules/appearance/cursor.nix
  #     ./modules/appearance/gtk.nix
  #   ];
  #   users.michael = {
  #     appearance = {
  #       cursor = {
  #         manage = extGfx;
  #         hyprtheme = "Nordzy-hyprcursors-white";
  #         xtheme = "Nordzy-cursors-white";
  #         size = 28;
  #         package = pkgs.nordzy-cursor-theme;
  #       };
  #     };
  #   };
  # };
}
