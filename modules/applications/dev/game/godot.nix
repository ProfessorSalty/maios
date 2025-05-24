{
  pkgs,
  lib,
  config,
  ...
}: {
  options.maios.applications.game.dev.godot = lib.mkEnableOption "";
  config = lib.mkIf config.maios.applications.game.dev.godot.enable {
    environment.systemPackages = with pkgs; [godot];
  };
}
