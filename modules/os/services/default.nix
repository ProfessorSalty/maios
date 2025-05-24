{inputs, ...}: {
  imports = [
    ./bluetooth.nix
    ./dconf.nix
    ./fonts.nix
    ./fuse.nix
    ./gnome-keyring.nix
    ./gnupg.nix
    ./nfs.nix
    ./openssh.nix
    ./packages.nix
    ./printing.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./virtualisation.nix
    ./xdg.nix
    ./xserver.nix
    inputs.stylix.nixosModules.stylix
  ];
}
