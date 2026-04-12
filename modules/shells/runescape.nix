{
  perSystem =
    { pkgs, ... }:
    {
      devShells.runescape = pkgs.mkShell {
        buildInputs = [
          pkgs.jdk21
          pkgs.libGL
        ]
        ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
          pkgs.libxxf86vm
        ];

        shellHook = ''
          export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [ pkgs.libGL ]}:''$LD_LIBRARY_PATH
        '';
      };
    };
}
