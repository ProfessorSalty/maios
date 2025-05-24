{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  cfg = config.maios.os.boot;
in {
  options.maios.os.boot.secureboot = lib.mkEnableOption "Enable secure boot (lanzaboote)";
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  config = {
    boot = lib.mkIf cfg.secureboot.enable {
      lanzaboote = {
        enable = true;
        pkiBundle = "/etc/secureboot";
      };

      # we let lanzaboote install systemd-boot
      loader.systemd-boot.enable = lib.mkForce false;
    };

    environment.systemPackages = [pkgs.sbctl];
  };
}
