{
  description = "Home Configs for Michael";

  inputs = {
    # My main system is tracking cosmic while it is in production for cachix hits
    cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixpkgs.follows = "cosmic/nixpkgs";
    nixpkgs-stable.follows = "cosmic/nixpkgs-stable";

    nix-devshells = {
      url = "github:Michael-C-Buckley/nix-devshells";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, nixpkgs-stable, home-manager, nix-devshells, ...} @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; config = { allowUnfree = true; }; };
    stablePkgs = import nixpkgs-stable { inherit system; config = { allowUnfree = true; }; };
  in {
    checks = nix-devshells.checks;
    devShells.x86_64-linux.default = nix-devshells.devShells.x86_64-linux.nixos;

    homeConfigurations = let 
      hmConfig = modules: home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit stablePkgs inputs;};
        inherit pkgs;
        modules = [./home.nix] ++ modules;
      };
    in {
      "michael" = hmConfig [];
      "michael@t14" = hmConfig [./hosts/t14 ./hosts/t14/home.nix];
      "michael@x570" = hmConfig [./hosts/x570 ./hosts/x570/home.nix];
      "michael@wsl" = hmConfig [./hosts/wsl ./hosts/wsl/home.nix];
    };

    # ---- nixosModules will not have access to the flake inputs here once imported elsewhere ----
    # ---- You will need to supply them, but can just follow them from this flake             ----
    nixosModules = let
      homeMod = host: {...}: { imports = [
        home-manager.nixosModules.home-manager
        ./home.nix
        ./hosts/${host}
        ./hosts/${host}/home.nix
      ];};
    in {
      home = {
        default = {...}: { imports = [./home.nix]; };
        wsl = homeMod "wsl";
        t14 = homeMod "t14";
        x570 = homeMod "x570";
      };

      # Hjem will only provide dotfile linking and some user-space packages via NixOS options
      hjem = let 
        hjemMod = host: {...}: { imports = [./hjem.nix ./hosts/${host} ./hosts/${host}/hjem.nix];};
      in {
        default = {...}: { imports = [./hjem.nix]; };
	      live-iso = self.outputs.nixosModules.hjem.default;
        p520 = self.outputs.nixosModules.hjem.default;
        t14 = hjemMod "t14";
        x570 = hjemMod "x570";
      };
    };
  };
}
