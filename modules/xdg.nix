{ ... }:

# Default applications

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
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
