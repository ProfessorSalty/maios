{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./godot.nix
    ./blender
  ];
}
