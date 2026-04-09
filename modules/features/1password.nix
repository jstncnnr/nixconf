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

      nixos = {
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
