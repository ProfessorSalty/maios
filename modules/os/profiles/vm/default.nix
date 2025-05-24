_: {
  # Enable GPU Drivers
  vm.guest-services.enable = true;
  drivers = {
    amdgpu.enable = false;
    nvidia.enable = false;
    nvidia-prime.enable = false;
    intel.enable = false;
  };
}
