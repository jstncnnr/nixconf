{ den, lib, ... }:
{
  den.aspects._1password =
    { host, ... }:
    {
      includes = [
        (den.provides.unfree [
          "1password"
          "1password-cli"
        ])
      ];

      nixos =
        { pkgs, ... }:
        {
          programs = {
            _1password.enable = true;
            _1password-gui = {
              enable = true;

              polkitPolicyOwners = lib.pipe host.users [
                lib.attrValues
                (lib.filter (u: u.isNormalUser or true))
                (map (u: u.userName))
              ];
            };
          };

          systemd.user.services."1password" = {
            description = "1Password auto start";

            after = [ "graphical-session.target" ];
            partOf = [ "graphical-session.target" ];
            wantedBy = [ "graphical-session.target" ];

            serviceConfig = {
              ExecStart = "${pkgs._1password-gui}/bin/1password --silent";
              Restart = "on-failure";
              RestartSec = 5;
            };
          };
        };

      homeManager =
        { pkgs, ... }:
        {
          programs.ssh.matchBlocks."*" = {
            identityAgent =
              if pkgs.stdenv.isLinux then
                "~/.1password/agent.sock"
              else
                "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
          };
        };

      darwin = {
        homebrew.casks = [
          "1password"
        ];
      };
    };
}
