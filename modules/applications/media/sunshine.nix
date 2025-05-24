{
  config,
  lib,
  ...
}: {
  options.maios.applications.media.sunshine.enable = lib.mkEnableOption "Install Sunshine and run on startup";

  config.services.sunshine = {
    inherit (config.maios.applications.media.sunshine) enable;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };
}
