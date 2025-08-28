# Split into per-host basis
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  inherit (config.features.michael) extendedGraphical;
  inherit (lib) mkDefault;
  extGfx = mkDefault extendedGraphical;
  myPkgs = import ../packageSets/extendedGraphical.nix {inherit pkgs;};
in {
  users.users.michael = {
    packages = myPkgs;
  };

  hjem = {
    extraModules = [
      inputs.hjem-rum.hjemModules.default
      ../modules/appearance/cursor.nix
      ../modules/appearance/gtk.nix
    ];
    users.michael = {
      enable = true;
      user = "michael";
      directory = "/home/michael";

      rum.misc.gtk = {
        enable = extGfx;
        packages = with pkgs; [
          nordzy-cursor-theme
          gruvbox-dark-icons-gtk
          arc-theme
        ];
        settings = {
          theme-name = "Arc-Dark";
          application-prefer-dark-theme = true;
        };
      };

      appearance = {
        cursor = {
          manage = extGfx;
          hyprtheme = "Nordzy-hyprcursors-white";
          xtheme = "Nordzy-cursors-white";
          size = 28;
          package = pkgs.nordzy-cursor-theme;
        };
      };
    };
  };
}
