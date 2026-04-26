{ den, ... }:
{
  den.aspects.justin = {
    includes = [
      (den.provides.unfree [ "microsoft-edge" ])
    ];

    provides.to-hosts.nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.nil
          pkgs.nixd

          pkgs.brave
          pkgs.microsoft-edge
        ];

        programs = {
          direnv.enable = true;

          # TODO: Is this really needed since we configure through
          # home manager? When would we ever have a nixos install
          # without home-manager?
          starship.enable = true;

          zsh = {
            autosuggestions.enable = true;
            syntaxHighlighting.enable = true;
          };
        };
      };
  };
}
