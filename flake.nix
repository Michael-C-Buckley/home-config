{
  description = "Home Configs for Michael";

  inputs = {
    # My main system is tracking cosmic while it is in production for cachix hits
    cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixpkgs.follows = "cosmic/nixpkgs";

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

    # nixosModules will not have access to the flake inputs here once imported elsehwere
    # You will need to supply them, but can just follow them from this flake
    nixosModules = {
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

      # Hjem will only provide dotfile linking and some user-space packages via NixOS options
      hjem.default = {...}: {
        imports = [./hjem.nix];
      };
    };
  };
}
