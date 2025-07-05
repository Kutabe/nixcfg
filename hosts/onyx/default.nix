# hosts/onyx/default.nix
{...}: {
  imports = [
    ./desktop
    ./networking
    ./programs

    ./boot.nix
    ./fontconfig.nix
    ./hardware.nix
    ./locale.nix
    ./users.nix

    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "cirno" ];
    auto-optimise-store = true;
  };

  services.flatpak.enable = true;

  system.stateVersion = "25.05";
}
