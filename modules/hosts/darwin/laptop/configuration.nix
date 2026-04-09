{ den, ... }:
{
  den.aspects.laptop = {
    includes = [
      den.provides.hostname
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

        casks = [
          "claude"
          "claude-code"
          "discord"
        ];

        masApps = {
          Magnet = 441258766;
        };
      };
    };
  };
}
