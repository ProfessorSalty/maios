_: let
  inherit (import ../../hosts/${host}/variables.nix) intelID nvidiaID;
in {
  # Enable GPU Drivers
  drivers = {
    amdgpu.enable = false;
    nvidia.enable = true;
    nvidia-prime = {
      enable = true;
      intelBusID = "${intelID}";
      nvidiaBusID = "${nvidiaID}";
    };
    intel.enable = false;
  };
  vm.guest-services.enable = false;
}
