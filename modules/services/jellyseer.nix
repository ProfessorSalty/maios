{ pkgs, ... }:

{
  services.jellyseerr = {
    enable = true;
    port = 5055;
    openFirewall = true;
    package = pkgs.jellyseerr; # Use the unstable package if stable is not up-to-date
  };
}
