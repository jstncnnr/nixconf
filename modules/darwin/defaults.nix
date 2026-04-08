{
  flake.darwinModules.defaults =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.nil
        pkgs.nixd
      ];

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

      programs = {
        zsh = {
          enable = true;
          enableAutosuggestions = true;
          enableSyntaxHighlighting = true;
        };

        direnv.enable = true;
      };

      system.defaults = {
        controlcenter = {
          BatteryShowPercentage = true;
        };

        finder = {
          AppleShowAllExtensions = true;
          CreateDesktop = false;
          FXPreferredViewStyle = "Nlsv";
          NewWindowTarget = "Home";
          _FXSortFoldersFirst = true;
        };

        NSGlobalDomain = {
          AppleShowAllExtensions = true;
          AppleShowScrollBars = "Always";
        };
      };
    };
}
