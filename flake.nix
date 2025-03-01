# flake.nix
# Don't copy and paste this.  Read above first if you tried to cheat and skim.
{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  /* So what does this say? It says that the outputs attribute of the attribute set defined by the flake.nix file is a function. That function takes an attribute set which contains nixpkgs and home-manager, as well as allowing any other random attributes that we don't care about. It creates an attribute set that contains a single attribute: homeConfigurations. */
  outputs = { nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations = {
        becker = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            ./zsh.nix
          ];
        };
      };
    };
}
