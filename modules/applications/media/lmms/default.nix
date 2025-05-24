{
  pkgs,
  lib,
  config,
  ...
}: {
  options.maios.applications.media.lmms = lib.mkEnableOption "lmms";
  config.environment = lib.mkIf config.maios.applications.media.lmms.enable {
    systemPackages = with pkgs; [lmms];
  };
}
