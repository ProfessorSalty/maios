{pkgs, ...}: {
  pico8 = pkgs.callPackage ./pico8.nix {};
  station = pkgs.callPackage ./station.nix {};
  webcamize = pkgs.callPackage ./webcamize.nix {};
}
