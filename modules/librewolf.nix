{ ... }:

{
  programs.librewolf = {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = builtins.readFile ../misc/firefox/userChrome.css;
    };
  };
}
