{
  inputs,
  ...
}:

{
  imports = [
    inputs.den.flakeModule
  ];

  den.schema.user = {
    # Default all users into home-manager integration
    classes = [ "homeManager" ];
  };

  den.default = {
    nixos = {
      system.stateVersion = "25.11";
    };

    darwin = {
      system.stateVersion = 6;
    };

    homeManager = {
      home.stateVersion = "25.11";
    };
  };
}
