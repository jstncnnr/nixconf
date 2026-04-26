{ den, ... }:
{
  den.aspects.niri = {
    nixos =
      { pkgs, ... }:
      {
        programs.niri = {
          enable = true;
          useNautilus = true;
        };

        programs.dms-shell = {
          enable = true;

          systemd = {
            enable = true;
            restartIfChanged = true;
          };

          enableSystemMonitoring = true;
          enableVPN = true;
          enableDynamicTheming = true;
          enableAudioWavelength = true;
          enableCalendarEvents = true;
          enableClipboardPaste = true;
        };

        services.displayManager.dms-greeter = {
          enable = true;
          compositor.name = "niri";
        };

        environment.systemPackages = [
          pkgs.xwayland-satellite
          pkgs.kitty
        ];
      };
  };
}
