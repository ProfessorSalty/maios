{
  pkgs,
  lib,
  config,
  ...
}: {
  options.maios.applications.game.dev.blender = lib.mkEnableOption "";
  config.environment = lib.mkIf config.maios.applications.game.dev.blender.enable {
    systemPackages = with pkgs; [blender];
  };
}
