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
        ];

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
