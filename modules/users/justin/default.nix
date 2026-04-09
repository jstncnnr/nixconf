{ den, ... }:
{
  den.aspects.justin = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
      den.provides.mutual-provider

      (den.provides.user-shell "zsh")

      den.aspects._1password
    ];
  };
}
