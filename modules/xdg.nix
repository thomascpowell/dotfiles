{ ... }:

# Default applications

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];

      "image/jpeg" = [ "mpv.desktop" ];
      "image/png" = [ "mpv.desktop" ];
      "image/webp" = [ "mpv.desktop" ];
      "image/gif" = [ "mpv.desktop" ];

      "video/mp4" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];

      "audio/mpeg" = [ "mpv.desktop" ];
      "audio/flac" = [ "mpv.desktop" ];
      "audio/wav" = [ "mpv.desktop" ];
    };
  };
}
