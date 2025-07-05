# hosts/onyx/users.nix
{ pkgs, ... }: {
  users.users.root = {
    shell = pkgs.zsh;
  };

  users.users.cirno = {
    isNormalUser = true;
    description = "Cirno";
    home = "/home/cirno";

    shell = pkgs.zsh;

    extraGroups = [
      "wheel"

      "audio"
      "video"
      "input"
      "render"

      "networkmanager"
      "flatpak"
      "qemu"
      "kvm"
      "libvirtd"
    ];
  };
}
