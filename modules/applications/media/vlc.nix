{
  pkgs,
  lib,
  config,
  ...
}: {
  options.maios.applications.media.vlc = {
    enable = lib.mkEnableOption "VLC - Media Player";
  };
  config = lib.mkIf config.maios.applications.media.vlc.enable {
    environment.systemPackages = with pkgs; [vlc];
  };
}
