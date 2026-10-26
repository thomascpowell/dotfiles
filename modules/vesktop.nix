{
  flake.homeModules.vesktop = {
    programs.vesktop = {
      enable = true;
      settings = {
        appBadge = false;
        checkUpdates = false;
        arRPC = false;
        customTitleBar = false;
        disableMinSize = true;
        minimizeToTray = false;
        tray = false;
        staticTitle = true;
        hardwareAcceleration = true;
        discordBranch = "stable";

        splashTheming = true;
        splashBackground = "#0A0A0A";
        splashColor = "#DDDDDD";
        enableSplashScreen = false;
      };
    };
  };
}
