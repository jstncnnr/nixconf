{ den, ... }:
{
  den.aspects.editors = {
    includes = [
      (den.provides.unfree [
        "claude-code-bin"
        "jetbrains-toolbox"
      ])
    ];

    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.claude-code-bin
          pkgs.jetbrains-toolbox
          pkgs.zed-editor
        ];
      };

    darwin = {
      homebrew.casks = [
        "claude"
        "claude-code@latest"
        "jetbrains-toolbox"
        "zed"
      ];
    };
  };
}
