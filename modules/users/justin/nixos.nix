{
  den.aspects.justin = {
    provides.to-hosts.nixos = {
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
