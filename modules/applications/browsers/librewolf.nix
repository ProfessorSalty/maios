{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.maios.applications.browsers;
in {
  options.maios.applications.browsers.librewolf = {
    enable = lib.mkEnableOption "LibreWolf";
  };

  config = {
    programs.firefox = {
      inherit (cfg.librewolf) enable;
      package = pkgs.librewolf;
      policies = {
        # install bitwarden extension and set it to the navbar
        ExtensionSettings = {
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4484791/bitwarden_password_manager-2025.4.0.xpi";
            installation_mode = "force_installed";
            default_area = "navbar";
          };
        };
      };
    };
  };
}
