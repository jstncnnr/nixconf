{ inputs, ... }:
{
  perSystem =
    { system, ... }:
    {
      devShells.rust =
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ inputs.rust-overlay.overlays.default ];
          };
        in
        pkgs.mkShell {
          buildInputs = [
            pkgs.rust-bin.stable.latest.default
            pkgs.rust-analyzer
          ];
        };
    };
}
