{pkgs, ...}: {
  imports = [
    ./animations-def.nix
    ./binds.nix
    ./greetd.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./stylix.nix
    ./swaync.nix
    ./waybar.nix
    ./wlogout
    ./themes
    ./rofi
  ];

  environment.systemPackages = with pkgs; [
    hyprpicker # Color Picker
    swww
    grim
    slurp
    wl-clipboard
    swappy
    ydotool
    brightnessctl # For Screen Brightness Control
    cliphist # Clipboard manager using rofi menu
    libnotify # For Notifications
    socat # Needed For Screenshots
    hyprpolkitagent
    hyprland-qtutils # needed for banners and ANR messages
  ];
}
