{
  flake.homeModules.mako = {
    services.mako = {
      enable = true;
      settings = {
        font = "Inter 12";
        background-color = "#0A0A0ACC";
        text-color = "#a8a8a8";
        border-color = "#2A2A2A";
        border-size = 1;
        padding = "10";
        default-timeout = 5000;
      };
    };
  };
}
