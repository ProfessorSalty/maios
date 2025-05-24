{
  pkgs,
  lib,
  config,
  ...
}: {
  options.maios.services.authentik = {
    enable = lib.mkEnableOption "Enable Authentik";
  };
  config = {
    environment.systemPackages = with pkgs; [
      authentik
      authentik-outposts.ldap
    ];
  };
}
