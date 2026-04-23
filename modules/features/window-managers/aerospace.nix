{
  den.aspects.aerospace = {
    darwin = {
      system.defaults = {
        dock.expose-group-apps = true;
        spaces.spans-displays = true;
      };

      services.aerospace = {
        enable = true;
        settings = {
          config-version = 2;
          default-root-container-layout = "tiles";
          on-focused-monitor-changed = [
            # Mouse follows focused monitor
            "move-mouse monitor-lazy-center"
          ];

          persistent-workspaces = [
            "1"
            "2"
            "3"
            "4"
            "5"
            "6"
            "S"
          ];

          accordion-padding = 0;
          gaps = {
            inner = {
              horizontal = 4;
              vertical = 4;
            };
          };

          mode.main.binding = {
            # Swap layout directions
            alt-slash = "layout tiles horizontal vertical";
            alt-comma = "layout accordion horizontal vertical";

            # Change focus
            alt-h = "focus --boundaries workspace --boundaries-action wrap-around-the-workspace left";
            alt-j = "focus --boundaries workspace --boundaries-action wrap-around-the-workspace down";
            alt-k = "focus --boundaries workspace --boundaries-action wrap-around-the-workspace up";
            alt-l = "focus --boundaries workspace --boundaries-action wrap-around-the-workspace right";

            # Swap with neighbor
            alt-shift-h = "swap left";
            alt-shift-l = "swap right";
            alt-shift-j = "swap down";
            alt-shift-k = "swap up";

            # Change workspace
            alt-1 = "workspace 1";
            alt-2 = "workspace 2";
            alt-3 = "workspace 3";
            alt-4 = "workspace 4";
            alt-5 = "workspace 5";
            alt-6 = "workspace 6";
            alt-s = "workspace --auto-back-and-forth S";

            # Move window to workspace
            alt-shift-1 = "move-node-to-workspace 1";
            alt-shift-2 = "move-node-to-workspace 2";
            alt-shift-3 = "move-node-to-workspace 3";
            alt-shift-4 = "move-node-to-workspace 4";
            alt-shift-5 = "move-node-to-workspace 5";
            alt-shift-6 = "move-node-to-workspace 6";
            alt-shift-s = "move-node-to-workspace S";
          };
        };
      };
    };
  };
}
