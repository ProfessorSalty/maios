{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (config.maios.applications.terminal) enableAll;
in {
  options.maios.applications.terminal.enableAll = lib.mkEnableOption "Enable all terminal applications";
  imports = [
    ./bash.nix
    ./bat.nix
    ./htop.nix
    ./kitty.nix
    ./starfish.nix
    ./starship.nix
    ./zoxide.nix
    ./zsh
  ];

  config = {
    maios.applications.terminal = lib.mkIf enableAll {
      bash.enable = true;
      bat.enable = true;
      htop.enable = true;
      kitty.enable = true;
      starfish.enable = true;
      zoxide.enable = true;
      starship.enable = true;
      zsh.enable = true;
    };

    environment = lib.mkIf enableAll {
      systemPackages = with pkgs; [
        cmatrix # Matrix Movie Effect In Terminal
        cowsay # Great Fun Terminal Program
        duf # Utility For Viewing Disk Usage In Terminal
        eog # For Image Viewing
        eza # Beautiful ls Replacement
        htop # Simple Terminal Based System Monitor
        inxi # CLI System Information Tool
        killall # For Killing All Instances Of Programs
        lolcat # Add Colors To Your Terminal Command Output
        lshw # Detailed Hardware Information
        ncdu # Disk Usage Analyzer With Ncurses Interface
        onefetch #provides build info on current system
        pciutils # Collection Of Tools For Inspecting PCI Devices
        playerctl # Allows Changing Media Volume Through Scripts
        ripgrep # Improved Grep
        usbutils # Good Tools For USB Devices
        wget # Tool For Fetching Files With Links
        ytmdl # Tool For Downloading Audio From YouTube
      ];
    };
  };
}
