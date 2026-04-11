{ den, ... }:
{
  den.aspects.editors = {
    includes = [
      (den.provides.unfree [ ])
    ];

    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.zed-editor
        ];
      };

    darwin = {
      homebrew.casks = [
        "zed"
      ];
    };
  };
}
