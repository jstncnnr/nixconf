{
  inputs,
  lib,
  moduleLocation,
  ...
}:

{
  imports = [
    inputs.flake-parts.flakeModules.modules
  ];

  options = {
    # flake-parts does not provide a darwinModules option like nixosModules, so
    # copy the same definition here.
    # https://github.com/hercules-ci/flake-parts/blob/main/modules/nixosModules.nix
    flake.darwinModules = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
      default = { };
      apply = lib.mapAttrs (
        k: v: {
          _class = "darwin";
          _file = "${toString moduleLocation}#nixosModules.${k}";
          imports = [ v ];
        }
      );
      description = ''
        nix-darwin modules.

        You may use this for reusable pieces of configuration, service modules, etc.
      '';
    };

    # flake-parts does not provide a darwinConfigurations option like nixosConfigurations, so
    # copy the same definition here.
    # https://github.com/hercules-ci/flake-parts/blob/main/modules/nixosConfigurations.nix
    flake.darwinConfigurations = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.raw;
      default = { };
      description = ''
        Instantiated nix-darwin configurations. Used by `darwin-rebuild`.

        `darwinConfigurations` is for specific machines. If you want to expose
        reusable configurations, add them to [`darwinModules`](#opt-flake.darwinModules)
        in the form of modules (no `lib.darwinSystem`), so that you can reference
        them in this or another flake's `darwinConfigurations`.
      '';
      example = lib.literalExpression ''
        {
          my-machine = inputs.nix-darwin.lib.darwinSystem {
            modules = [
              ./my-machine/darwin-configuration.nix
              config.darwinModules.my-module
            ];
          };
        }
      '';
    };
  };
}
