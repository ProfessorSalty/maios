{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    jetbrains.rider
    jetbrains.webstorm
    jetbrains.pycharm-professional
  ];
}
