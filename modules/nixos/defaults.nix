{
  flake.nixosModules.defaults =
    { pkgs, ... }:
    {
      boot = {
        kernelPackages = pkgs.linuxPackages_latest;

        loader = {
          efi.canTouchEfiVariables = true;
          systemd-boot.enable = true;
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

      environment.systemPackages = [
        pkgs.nil
        pkgs.nixd
      ];
    };
}
