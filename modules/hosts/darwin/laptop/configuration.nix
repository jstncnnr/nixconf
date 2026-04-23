{ den, ... }:
{
  den.aspects.laptop = {
    includes = [
      den.provides.hostname

      den.aspects.aerospace
    ];

    darwin = {
      nix = {
        # Let Determinate Systems manage the nix install
        enable = false;
      };

      homebrew = {
        enable = true;
        enableZshIntegration = true;
        onActivation.cleanup = "uninstall";

        brews = [

        ];
      };
    };
  };
}
