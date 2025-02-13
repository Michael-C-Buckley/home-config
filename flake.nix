{
  description = "Home Configs for Michael";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    hmConfig = inputs.home-manager.lib.homeManagerConfiguration;
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    homeConfigurations = {
      "michael@x570" = hmConfig {
        extraSpecialArgs = {inherit inputs;};
        inherit pkgs;
        modules = [./home.nix ./hosts/x570.nix];
      };

      "michael@t14" = hmConfig {
        extraSpecialArgs = {inherit inputs;};
        inherit pkgs;
        modules = [./home.nix ./hosts/t14.nix];
      };

      "michael" = hmConfig {
        extraSpecialArgs = {inherit inputs;};
        inherit pkgs;
        modules = [./home.nix];
      };
    };

    nixosModules = {
      # The home configuration can be imported directly into a config as to become module-based
      # CAUTION: Inputs will need to be defined in the system-flake if going this route
      home-manager = {
        x570 = {...}: {
          imports = [./home.nix ./hosts/x570.nix];
        };

        t14 = {...}: {
          imports = [./home.nix ./hosts/t14.nix];
        };

        default = {...}: {
          imports = [./home.nix];
        };
      };

      # Hjem will only provide dotfile linking
      hjem.default = {...}: {
        imports = [./hjem.nix];
      };
    };
  };
}
