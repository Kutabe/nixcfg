# hosts/onyx/networking/default.nix
{
  imports = [
    ./firewall.nix
  ];

  networking = {
    hostName = "onyx";
    networkmanager.enable = true;
    firewall.enable = true;
    nftables.enable = true;
  };
}
