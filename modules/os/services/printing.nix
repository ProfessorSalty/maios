{config, ...}: let
  inherit (config.maios.os.printing) enable;
in {
  services = {
    printing = {
      inherit enable;
      drivers = [
        # pkgs.hplipWithPlugin
      ];
    };
    avahi = {
      inherit enable;
      nssmdns4 = true;
      openFirewall = true;
    };
    ipp-usb.enable = enable;
  };
}
