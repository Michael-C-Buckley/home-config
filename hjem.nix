# Base Entry for the Hjem outputs
{config, pkgs, lib, inputs, ...}: {
  imports = [
    inputs.hjem.nixosModules.default
  ];

  users.users.michael.packages = (import ./packages/common.nix {inherit pkgs;});

  hjem = {
    clobberByDefault = true;
    users.michael = {
      enable = true;
      user = "michael";
      directory = "/home/michael";
      files = import ./files/fileList.nix {inherit config lib;};
    };
  };
}