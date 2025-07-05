# hosts/onyx/boot.nix
{ pkgs, ... }: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_lqx;
    kernelModules = ["tcp_bbr"];

    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "fs.inotify.max_user_watches" = 65536;

      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.ipv4.tcp_rmem" = "4096 8388608 1073741824";
      "net.ipv4.tcp_wmem" = "4096 8388608 1073741824";
      "net.ipv4.tcp_fastopen" = 3;

      "net.ipv6.tcp_congestion_control" = "bbr";
      "net.ipv6.tcp_rmem" = "4096 8388608 1073741824";
      "net.ipv6.tcp_wmem" = "4096 8388608 1073741824";
      "net.ipv6.tcp_fastopen" = 3;

      "net.core.default_qdisc" = "fq";
      "net.core.rmem_max" = 1073741824;
      "net.core.wmem_max" = 1073741824;
    };

    tmp.cleanOnBoot = true;
  };
}
