{
  den.aspects.justin = {
    provides.to-hosts.darwin =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.nil
          pkgs.nixd
        ];

        homebrew.casks = [
          "brave-browser"
          "discord"
          "microsoft-office"
          "microsoft-teams"
          "microsoft-edge"
        ];

        homebrew.masApps = {
          "1Password-For-Safari" = 1569813296;
          Magnet = 441258766;
        };

        programs = {
          direnv.enable = true;

          zsh = {
            enableAutosuggestions = true;
            enableSyntaxHighlighting = true;
          };
        };

        system.defaults = {
          controlcenter = {
            BatteryShowPercentage = true;
          };

          dock = {
            mru-spaces = false;
            show-recents = false;

            wvous-bl-corner = 1;
            wvous-br-corner = 1;
            wvous-tl-corner = 1;
            wvous-tr-corner = 1;
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
  };
}
