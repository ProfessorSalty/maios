{
  lib,
  config,
  pkgs,
  ...
}: {
  options.maios.applications.communication.discord = {
    enable = lib.mkEnableOption "Unleash the Shitcord";
  };
  config = lib.mkIf config.maios.applications.communication.discord {
    environment.systemPackages = with pkgs; [discord-ptb];
  };
}
