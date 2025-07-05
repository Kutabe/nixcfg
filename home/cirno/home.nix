# home/cirno/home.nix
{ pkgs, zen-browser, ... }:
let
  starshipConfigFile = builtins.readFile ./starship.toml;
  starshipConfig = builtins.fromTOML starshipConfigFile;
in {
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
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = starshipConfig;
  };

  home.sessionVariables = {
    WINEDLLOVERRIDES = "winemenubuilder.exe=d";
    WINEWAYLAND_DISABLE_XWAYLAND = "1";
    WINE_VK_VULKAN_ONLY = "1";
    DXVK_ENABLE_NVAPI = "0";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };


  programs.home-manager.enable = true;
}
