{
  config,
  pkgs,
  lib,
  ...
}:

# Menu

{
  home.packages = with pkgs; [
    rofi

    (writeShellScriptBin "emoji" ''
      #!/bin/sh

      tail -n +3 ~/dotfiles/misc/data/emoji_list | rofi -case-smart -sorting-method fzf -dmenu | awk '{print $1}' | tr -d '\n' | cb
    '')

    (writeShellScriptBin "accent" ''
      #!/bin/sh

      accent= printf '%s' "$(sed -n '/^__DATA__$/,$p' "$0" | tail -n +2)" | awk -F';' '{print $1 " " $2}' | rofi -case-smart -sorting-method fzf -dmenu | awk '{print $1}' | tr -d '\n' | cb
      exit;

      __DATA__
      á; a
      é; e
      í; i
      ó; o
      ú; u
      ñ; n
    '')
  ];

  home.file.".config/rofi/theme.rasi".source = ../config/rofi/theme.rasi;

  home.file.".config/rofi/theme.rasi".text = ''
    * {
      y-offset: 0;
      width: ${toString (config.device.dpi * 8)};
      items: 5;
      lack: #708090;
      luster: #deeeed;
      orange: #ffaa88;
      green: #789978;
      blue: #7788AA;
      red: #D70000;
      black: #000000;
      gray1: #080808;
      gray2: #191919;
      gray3: #2a2a2a;
      gray4: #444444;
      gray5: #555555;
      gray6: #7a7a7a;
      gray7: #aaaaaa;
      gray8: #cccccc;
      gray9: #DDDDDD;
    }

    * {
      font: "system-ui 18";
      border-radius: 5px;
      background-color: transparent;
      text-color: @gray9;
      margin: 0px;
      padding: 0px;
      spacing: 0px;
    }

    window {
      background-color: @gray2;
      y-offset: @y-offset;
      width: @width;
      border-radius: 10px;
    }

    mainbox {
      padding: 10px;
    }

    inputbar {
      background-color: @gray3;
      padding: 8px 16px;
      spacing: 16px;
      children: [ entry ];
    }

    prompt {
      text-color: @gray6;
    }

    entry {
      placeholder: "";
      placeholder-color: @gray5;
    }

    message {
      margin: 16px 0 0;
      background-color: @gray2;
    }

    textbox {
      padding: 8px 24px;
    }

    listview {
      background-color:transparent;
      // scrollbar: true;
      scrollbar-width: 5;
      margin: 10px 0 0;
      columns: 1;
      lines: @items;
      dynamic: true;
      fixed-height: false;
    }

    scrollbar {
      background-color: @gray3;
      handle-width: 10px;
      handle-color: @gray5;
      margin: 0px 0px 0px 10px;
    }

    element {
      padding: 8px 16px;
      spacing: 8px;
    }

    element-icon {
      size: 1em;
      vertical-align: 0.5;
    }

    element-text {
      text-color: @gray6;
    }
    element selected normal, element selected active {
      background-color: @gray9;
      text-color: @gray1;
    }

    element-text {
      highlight: none;
    }

    element-text selected {
      text-color: @gray1;
    }
  '';

  home.file.".config/rofi/config.rasi".text = ''
    configuration {
      modi: "drun,run,window";
      show-icons: false;
      dpi: ${toString config.device.dpi};
    }
    @theme "theme"
  '';
}
