{ inputs, self, ... }:

{
  flake.darwinConfigurations.laptop = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.darwinModules.laptopConfiguration
      self.darwinModules.defaults
    ];
  };
}
