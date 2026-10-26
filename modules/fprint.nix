{
  flake.nixosModules.fprint =
    { ... }:
    {
      services.fprintd.enable = true;
      security.pam.services.ly.fprintAuth = false;
      security.pam.services.swaylock.fprintAuth = true;

      security.pam.services.sudo = {
        fprintAuth = true;
        rules.auth.fprintd.settings."max-tries" = 5;
      };
    };

}
