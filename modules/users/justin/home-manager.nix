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

        ssh = {
          enable = true;
          enableDefaultConfig = false;

          matchBlocks."*" = {
            forwardAgent = false;
            addKeysToAgent = "no";
            compression = false;
            serverAliveInterval = 0;
            serverAliveCountMax = 3;
            hashKnownHosts = false;
            userKnownHostsFile = "~/.ssh/known_hosts";
            controlMaster = "no";
            controlPath = "~/.ssh/master-%r@%n:%p";
            controlPersist = "no";
          };
        };

        starship.enable = true;
      };
    };
  };
}
