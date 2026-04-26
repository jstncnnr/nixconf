{ den, ... }:
{
  den.aspects.desktop = {
    includes = [
      den.provides.hostname

      den.aspects.niri
      den.aspects.gaming
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

        time.timeZone = "America/Denver";
        networking.networkmanager.enable = true;

        services = {
          xserver.xkb.layout = "us";

          pipewire = {
            enable = true;
            pulse.enable = true;
          };

          flatpak.enable = true;
        };
      };
  };
}
