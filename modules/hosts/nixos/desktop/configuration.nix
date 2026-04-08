{
  flake.nixosModules.desktopConfiguration =
    { pkgs, ... }:
    {
      imports = [
        ./_hardware-configuration.nix
      ];

      time.timeZone = "America/Denver";
      networking.networkmanager.enable = true;

      environment.systemPackages = [
        pkgs.brave
        pkgs.git
      ];

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

        flatpak = {
          enable = true;
        };
      };

      system.stateVersion = "25.11";
    };
}
