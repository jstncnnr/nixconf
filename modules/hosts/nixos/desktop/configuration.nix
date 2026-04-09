{ den, ... }:
{
  den.aspects.desktop = {
    includes = [
      den.provides.hostname
    ];

    nixos =
      { pkgs, ... }:
      {
        boot = {
          kernelPackages = pkgs.linuxPackages_latest;

          loader = {
            efi.canTouchEfiVariables = true;
            systemd-boot = {
              enable = true;
              configurationLimit = 10;
            };
          };
        };

        nix = {
          settings = {
            experimental-features = [
              "nix-command"
              "flakes"
            ];
          };
        };

        networking.networkmanager.enable = true;

        services = {
          xserver.xkb.layout = "us";

          pipewire = {
            enable = true;
            pulse.enable = true;
          };

          displayManager.gdm = {
            enable = true;
            autoSuspend = false;
          };

          desktopManager.gnome = {
            enable = true;
          };

          flatpak.enable = true;
        };
      };
  };
}
