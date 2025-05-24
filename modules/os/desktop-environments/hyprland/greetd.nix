{
  pkgs,
  config,
  ...
}: let
  inherit (config.maios.os.desktop-environments.hyprland) enable;
  userCfg = config.maios.user;
in {
  environment.systemPackages = with pkgs; [greetd.tuigreet];
  services.greetd = {
    inherit enable;
    vt = 3;
    settings = {
      default_session = {
        user = userCfg.username;
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland"; # start Hyprland with a TUI login manager
      };
    };
  };
}
