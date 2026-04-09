{ den, ... }:
{
  den.aspects.laptop = {
    includes = [
      den.provides.hostname
    ];

    darwin =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.nil
          pkgs.nixd
        ];

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
            "1password"
            "brave-browser"
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
