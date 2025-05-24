_: {
  # Enable GPU Drivers
  drivers = {
    amdgpu.enable = true;
    nvidia.enable = true;
    nvidia-prime.enable = false;
    intel.enable = false;
  };

  vm.guest-services.enable = false;
}
