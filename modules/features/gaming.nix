{ den, ... }:
{
  den.aspects.gaming = {
    includes = [
      (den.provides.unfree [ ])
    ];

    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          (pkgs.bolt-launcher.override {
            enableRS3 = true;
          })
        ];

        # Required when enableRS3 is true unfortunately.
        nixpkgs.config.permittedInsecurePackages = [
          "openssl-1.1.1w"
        ];
      };
  };
}
