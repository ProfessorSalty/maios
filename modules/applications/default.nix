{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./browsers
    ./communication
    ./dev
    ./editors
    ./file-managers
    ./media
    ./security
    ./terminal
  ];

  options.maios.programs = {
    mosh.enable = lib.mkEnableOption "Mosh Client";
  };

  config = {
    programs.mosh.enable = config.maios.programs.mosh.enable;

    environment.systemPackages = with pkgs; [
      appimage-run # Needed For AppImage Support
      brightnessctl # For Screen Brightness Control
      cliphist # Clipboard manager using rofi menu
      cmatrix # Matrix Movie Effect In Terminal
      cowsay # Great Fun Terminal Program
      duf # Utility For Viewing Disk Usage In Terminal
      eog # For Image Viewing
      eza # Beautiful ls Replacement
      ffmpeg # Terminal Video / Audio Editing
      file-roller # Archive Manager
      glxinfo #needed for inxi diag util
      htop # Simple Terminal Based System Monitor
      inxi # CLI System Information Tool
      killall # For Killing All Instances Of Programs
      libnotify # For Notifications
      lm_sensors # Used For Getting Hardware Temps
      lolcat # Add Colors To Your Terminal Command Output
      lshw # Detailed Hardware Information
      ncdu # Disk Usage Analyzer With Ncurses Interface
      nixfmt-rfc-style # Nix Formatter
      nwg-displays #configure monitor configs via GUI
      onefetch #provides build info on current system
      pciutils # Collection Of Tools For Inspecting PCI Devices
      pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
      playerctl # Allows Changing Media Volume Through Scripts
      ripgrep # Improved Grep
      socat # Needed For Screenshots
      unrar # Tool For Handling .rar Files
      unzip # Tool For Handling .zip Files
      usbutils # Good Tools For USB Devices
      v4l-utils # Used For Things Like OBS Virtual Camera
      wget # Tool For Fetching Files With Links
      ytmdl # Tool For Downloading Audio From YouTube
    ];
  };
}
