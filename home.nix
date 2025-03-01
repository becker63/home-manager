/* So basically: a module is a file that contains a function. That function takes a single argument (as all Nix functions do). The argument is an attribute set which contains some number of inputs that are provided by the module system. The output is an attribute set that contains some configuration values.*/
{ lib, pkgs, ... }: let
  username = "becker";
in {
  home = {
    packages = with pkgs; [
      cowsay
      direnv
      nix-direnv
    ];

    inherit username;
    homeDirectory = "/home/${username}";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "23.11";
  };
  programs.direnv = {
    enable = true;
    silent = true;
    enableZshIntegration = true;
  };
}
