{lib, pkgs, ...}:
{
  home.packages = with pkgs; [
    zsh
    starship
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-fast-syntax-highlighting
    zsh-autocomplete
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "direnv"
      ];
    };
  };

  # Install Starship Prompt
  programs.starship = {
    enable = true;
  };
}
