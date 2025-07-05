# hosts/onyx/networking/firewall.nix
{
  networking.firewall = {
    allowedTCPPorts = [
      22
    ];
    allowedUDPPorts = [

    ];
  };
}
