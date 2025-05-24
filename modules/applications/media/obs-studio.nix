{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.maios.applications.media;
in {
  options.maios.applications.media.obs-studio.enable = lib.mkEnableOption "OBS Studio";
  config = lib.mkIf cfg.obs-studio.enable {
    environment.systemPackages = with pkgs; [
      obs-cli
      obs-cmd
    ];

    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins;
        [
          advanced-scene-switcher
          obs-3d-effect
          obs-advanced-masks
          obs-command-source
          obs-composite-blur
          obs-gradient-source
          obs-gstreamer
          obs-move-transition
          obs-pipewire-audio-capture
          obs-scale-to-sound
          obs-shaderfilter
          obs-source-clone
          obs-source-record
          obs-source-switcher
          obs-teleport
          obs-transition-table
          obs-text-pthread
          obs-vaapi
          obs-vintage-filter
          obs-webkitgtk
          obs-websocket
          waveform
        ]
        ++ [
          pkgs.obs-aitum-multistream
          pkgs.obs-dvd-screensaver
          pkgs.obs-markdown
          pkgs.obs-rgb-levels
          pkgs.obs-scene-as-transition
          pkgs.obs-stroke-glow-shadow
          pkgs.obs-urlsource
          pkgs.obs-vertical-canvas
          pkgs.pixel-art
        ];
    };
  };
}
