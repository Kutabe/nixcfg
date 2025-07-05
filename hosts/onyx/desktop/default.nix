# hosts/onyx/desktop/default.nix
{ pkgs, ... }: {
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = false;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];

#   environment.plasma6.excludePackages = with pkgs; [
#     elisa
#   ];

  environment.systemPackages = with pkgs; [
    kdePackages.kde-gtk-config
  ];
}
