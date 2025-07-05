# hosts/onyx/programs/default.nix
{ pkgs, ... }: {

  # PACKAGES
  environment.systemPackages = with pkgs; [
    bat
    btop
    curl
    dnsutils # dig, nslookup, _
    eza # ls -> exa -> eza
    ffmpeg
    fzf
    git
    home-manager # nix user env manager & stuff
    iputils
    micro
    mtr # trace+ping
    nix-index # some dependency
    tealdeer
    timg # term img, video, pdf
    tmux
    tree
    wireguard-tools
    wget

    qmk
    qmk-udev-rules
    virt-manager
    wineWowPackages.stable
    winetricks
    protontricks
    dxvk
    vkd3d
    mangohud
    protonup
    heroic
    lutris
  ];

  # SSH
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      X11Forwarding = false;
      UseDns = true;
      PermitRootLogin = "no";
    };
  };


  # STEAM
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    #dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;

  # SHELL
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "fzf"
        "git"
      ];
    };
    shellAliases = {
      ".."  = "cd ..";
      "..." = "cd ../..";
      "ls"  = "eza --icons=auto";
      "ll"  = "ls -l";
      "la"  = "ls -la";
    };
  };
  programs.pay-respects.enable = true;
  programs.starship = {
    enable = true;
  };
}
