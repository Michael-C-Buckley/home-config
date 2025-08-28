{inputs, ...}: {
  default = _: {
    imports = [
      ../flake/hjem/default.nix
      ../flake/hjem/extended.nix
    ];
    # I am currently only using Hjem on x86_64-linux
    users.users.michael.packages = [inputs.nvf-flake.packages.x86_64-linux.default];
  };
  minimal = _: {
    # I am currently only using Hjem on x86_64-linux
    imports = [../flake/hjem/default.nix];
    users.users.michael.packages = [inputs.nvf-flake.packages.x86_64-linux.minimal];
  };
}
