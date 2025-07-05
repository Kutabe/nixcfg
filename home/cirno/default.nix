# home/cirno/default.nix
{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./home.nix
  ];
}
