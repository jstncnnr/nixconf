{
  flake.darwinModules.laptopConfiguration =
    { pkgs, ... }:
    {
      users.users = {
        justin = {
          description = "Justin Conner";
          shell = pkgs.zsh;
        };
      };

      environment.systemPackages = [
        pkgs.nil
        pkgs.nixd
      ];

      nixpkgs.hostPlatform = "aarch64-darwin";
      nix = {
        # Let Determinate Systems manage the nix install
        enable = false;
      };

      system = {
        primaryUser = "justin";

        stateVersion = 6;
      };
    };
}
