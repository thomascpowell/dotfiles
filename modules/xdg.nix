{ ... }:

# Default applications

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = [ "librewolf.desktop" ];
      "x-scheme-handler/http" = [ "librewolf.desktop" ];
      "x-scheme-handler/https" = [ "librewolf.desktop" ];

      "application/pdf" = [ "org.pwmt.zathura.desktop" ];

      "image/jpeg" = [ "imv.desktop" ];
      "image/png" = [ "imv.desktop" ];
      "image/webp" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];

      "video/mp4" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];

      "audio/mpeg" = [ "mpv.desktop" ];
      "audio/flac" = [ "mpv.desktop" ];
      "audio/wav" = [ "mpv.desktop" ];
    };
  };
}
