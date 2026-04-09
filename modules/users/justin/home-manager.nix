{
  den.aspects.justin = {
    provides.to-hosts.homeManager = {
      programs = {
        git = {
          enable = true;
          settings = {
            init.defaultBranch = "master";

            user.name = "Justin Conner";
            user.email = "jstncnnr@outlook.com";
          };
        };

        starship.enable = true;
      };
    };
  };
}
