# home/cirno/home.nix
{ pkgs, zen-browser, ... }: {
  imports = [
    zen-browser.homeModules.beta
  ];
  home.username = "cirno";
  home.homeDirectory = "/home/cirno";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # Golang
    go
    gopls
    golangci-lint
    gosec
    gotests

    # GIT
    git-credential-manager

    # Nix
    nil # lsp
    alejandra # code fmt
    statix # linter
    deadnix # dead code finder

    # Desktop
    obs-studio
    telegram-desktop
    haruna # video player
    yt-dlp # ^ haruna's soft dep
    libreoffice-qt6-fresh
    thunderbird
    mangojuice
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };
  xdg.configFile."starship.toml".source = ./starship.toml;

  home.sessionVariables = {

  };


  programs.home-manager.enable = true;
}
