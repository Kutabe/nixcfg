# hosts/onyx/hardware.nix
{
  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    keyboard.qmk.enable = true;
  };
}
