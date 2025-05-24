{
  config,
  lib,
  pkgs,
  ...
}: {
  options.maios.programs.media.moonlight.enable = lib.mkEnableOption "Install Moonlight";

  config.environment = lib.mkIf config.maios.programs.media.moonlight.enable {
    systemPackages = with pkgs; [moonlight-qt];
  };
}
