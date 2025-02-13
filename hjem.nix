# Base Entry for the Hjem outputs
{ inputs, ... }: {
  imports = [
    inputs.hjem.nixosModules.default
    ./files/hjem.nix
    ./packages/hjem.nix
  ];

  hjem = {
    clobberByDefault = true;
    users.michael = {
      enable = true;
      user = "michael";
      directory = "/home/michael";
    };
  };
}