{
  flake.homeModules.theme =
    { pkgs, ... }:
    let
      gtk3Css = ''
        @define-color theme_bg_color #0A0A0A;
        @define-color theme_fg_color #DDDDDD;
        @define-color theme_base_color #191919;
        @define-color theme_text_color #DDDDDD;
        @define-color theme_selected_bg_color #2A2A2A;
        @define-color theme_selected_fg_color #DDDDDD;
        @define-color insensitive_bg_color #151515;
        @define-color insensitive_fg_color #a8a8a8;
        @define-color insensitive_base_color #151515;
        @define-color borders rgba(221, 221, 221, 0.14);
        @define-color unfocused_borders rgba(221, 221, 221, 0.08);
        @define-color warning_color #a9a900;
        @define-color error_color #a90000;
        @define-color success_color #00a900;

        * {
          color: @theme_fg_color;
          caret-color: #708090;
          -gtk-icon-style: symbolic;
          -gtk-icon-shadow: none;
        }

        window,
        .background,
        .csd {
          background-color: @theme_bg_color;
          color: @theme_fg_color;
        }

        headerbar,
        .titlebar,
        toolbar,
        menubar {
          background-color: #191919;
          color: @theme_fg_color;
          border-color: @borders;
          box-shadow: none;
        }

        .view,
        textview text,
        entry,
        spinbutton,
        list,
        treeview,
        iconview,
        placessidebar,
        notebook > stack {
          background-color: @theme_base_color;
          color: @theme_text_color;
        }

        button,
        combobox button,
        spinbutton button {
          background-image: none;
          background-color: #191919;
          color: @theme_fg_color;
          border-color: @borders;
          box-shadow: none;
        }

        button:hover,
        combobox button:hover,
        spinbutton button:hover,
        row:hover,
        menuitem:hover {
          background-image: none;
          background-color: #2A2A2A;
          color: @theme_selected_fg_color;
          border-color: @borders;
        }

        button:active,
        button:checked,
        row:selected,
        treeview.view:selected,
        iconview:selected,
        menuitem:checked {
          background-image: none;
          background-color: @theme_selected_bg_color;
          color: @theme_selected_fg_color;
        }

        entry:focus,
        textview:focus,
        button:focus {
          border-color: #708090;
          box-shadow: inset 0 0 0 1px #708090;
        }

        menu,
        menuitem,
        popover,
        popover contents,
        tooltip {
          background-color: #191919;
          color: @theme_fg_color;
          border-color: @borders;
        }

        separator,
        frame,
        scrolledwindow {
          border-color: @borders;
        }

        scrollbar trough,
        scale trough,
        progressbar trough {
          background-color: #0A0A0A;
          border-color: @borders;
        }

        scrollbar slider,
        scale highlight,
        progressbar progress {
          background-color: #2A2A2A;
          border-color: #2A2A2A;
        }

        scrollbar slider:hover,
        scale highlight:focus {
          background-color: #708090;
          border-color: #708090;
        }

        check,
        radio {
          background-image: none;
          background-color: #191919;
          color: @theme_fg_color;
          border: 1px solid @borders;
          box-shadow: none;
        }

        check:checked,
        radio:checked,
        check:indeterminate,
        radio:indeterminate {
          background-color: #2A2A2A;
          color: #708090;
          border-color: #708090;
        }

        switch {
          background-color: #0A0A0A;
          border-color: @borders;
        }

        switch slider {
          background-color: #DDDDDD;
        }

        switch:checked {
          background-color: #2A2A2A;
          border-color: #708090;
        }

        switch:disabled,
        button:disabled,
        entry:disabled,
        label:disabled {
          background-color: @insensitive_bg_color;
          color: @insensitive_fg_color;
          border-color: @unfocused_borders;
        }

        selection {
          background-color: @theme_selected_bg_color;
          color: @theme_selected_fg_color;
        }

        rubberband {
          background-color: rgba(112, 128, 144, 0.25);
          border-color: #708090;
        }
      '';

      gtk3Index = pkgs.writeText "ll-index.theme" ''
        [Desktop Entry]
        Type=X-GNOME-Metatheme
        Name=ll
        Comment=ll

        [X-GNOME-Metatheme]
        GtkTheme=ll
        IconTheme=Adwaita
        CursorTheme=Adwaita
      '';

      gtk3CssFile = pkgs.writeText "ll-gtk3.css" gtk3Css;

      llGtk3Theme = pkgs.runCommand "ll-gtk3-theme-1" { } ''
        theme_dir=$out/share/themes/ll
        mkdir -p "$theme_dir/gtk-3.0" "$theme_dir/gtk-3.20"
        install -Dm644 ${gtk3Index} "$theme_dir/index.theme"
        install -Dm644 ${gtk3CssFile} "$theme_dir/gtk-3.0/gtk.css"
        install -Dm644 ${gtk3CssFile} "$theme_dir/gtk-3.20/gtk.css"
      '';

      gtk4Css = ''
        :root {
          --accent-bg-color: #708090;
          --accent-fg-color: #0A0A0A;
          --accent-color: #9aaaae;
          --destructive-bg-color: #a90000;
          --destructive-fg-color: #DDDDDD;
          --success-bg-color: #708090;
          --success-fg-color: #0A0A0A;
          --warning-bg-color: #a8a8a8;
          --warning-fg-color: #0A0A0A;
          --error-bg-color: #a90000;
          --error-fg-color: #DDDDDD;
          --window-bg-color: #0A0A0A;
          --window-fg-color: #DDDDDD;
          --view-bg-color: #191919;
          --view-fg-color: #DDDDDD;
          --headerbar-bg-color: #151515;
          --headerbar-fg-color: #DDDDDD;
          --headerbar-border-color: #2A2A2A;
          --headerbar-shade-color: rgba(0, 0, 0, 0.25);
          --headerbar-darker-shade-color: rgba(0, 0, 0, 0.45);
          --card-bg-color: #202020;
          --card-fg-color: #DDDDDD;
          --card-shade-color: rgba(0, 0, 0, 0.22);
          --dialog-bg-color: #151515;
          --dialog-fg-color: #DDDDDD;
          --popover-bg-color: #202020;
          --popover-fg-color: #DDDDDD;
          --popover-shade-color: rgba(0, 0, 0, 0.25);
          --sidebar-bg-color: #121212;
          --sidebar-fg-color: #DDDDDD;
          --sidebar-border-color: #2A2A2A;
          --sidebar-shade-color: rgba(0, 0, 0, 0.25);
          --secondary-sidebar-bg-color: #151515;
          --secondary-sidebar-fg-color: #DDDDDD;
          --secondary-sidebar-border-color: #2A2A2A;
          --secondary-sidebar-shade-color: rgba(0, 0, 0, 0.25);
          --thumbnail-bg-color: #202020;
          --thumbnail-fg-color: #DDDDDD;
          --shade-color: rgba(0, 0, 0, 0.25);
          --scrollbar-outline-color: rgba(221, 221, 221, 0.25);
        }

        @define-color accent_bg_color #708090;
        @define-color accent_fg_color #0A0A0A;
        @define-color accent_color #9aaaae;
        @define-color window_bg_color #0A0A0A;
        @define-color window_fg_color #DDDDDD;
        @define-color view_bg_color #191919;
        @define-color view_fg_color #DDDDDD;
        @define-color headerbar_bg_color #151515;
        @define-color headerbar_fg_color #DDDDDD;
        @define-color headerbar_border_color #2A2A2A;
        @define-color headerbar_shade_color rgba(0, 0, 0, 0.25);
        @define-color headerbar_darker_shade_color rgba(0, 0, 0, 0.45);
        @define-color card_bg_color #202020;
        @define-color card_fg_color #DDDDDD;
        @define-color card_shade_color rgba(0, 0, 0, 0.22);
        @define-color dialog_bg_color #151515;
        @define-color dialog_fg_color #DDDDDD;
        @define-color popover_bg_color #202020;
        @define-color popover_fg_color #DDDDDD;
        @define-color popover_shade_color rgba(0, 0, 0, 0.25);
        @define-color sidebar_bg_color #121212;
        @define-color sidebar_fg_color #DDDDDD;
        @define-color sidebar_border_color #2A2A2A;
        @define-color sidebar_shade_color rgba(0, 0, 0, 0.25);
        @define-color secondary_sidebar_bg_color #151515;
        @define-color secondary_sidebar_fg_color #DDDDDD;
        @define-color secondary_sidebar_border_color #2A2A2A;
        @define-color secondary_sidebar_shade_color rgba(0, 0, 0, 0.25);
        @define-color thumbnail_bg_color #202020;
        @define-color thumbnail_fg_color #DDDDDD;
        @define-color destructive_bg_color #a90000;
        @define-color destructive_fg_color #DDDDDD;
        @define-color success_bg_color #708090;
        @define-color success_fg_color #0A0A0A;
        @define-color warning_bg_color #a8a8a8;
        @define-color warning_fg_color #0A0A0A;
        @define-color error_bg_color #a90000;
        @define-color error_fg_color #DDDDDD;
        @define-color shade_color rgba(0, 0, 0, 0.25);
        @define-color scrollbar_outline_color rgba(221, 221, 221, 0.25);

        * {
          font-weight: 400;
        }
      '';

    in
    {
      gtk = {
        enable = true;
        theme = {
          name = "ll";
          package = llGtk3Theme;
        };
        font = {
          name = "System-ui";
          size = 10;
        };
        iconTheme.name = "Adwaita";
        cursorTheme = {
          name = "Adwaita";
          size = 24;
        };
        colorScheme = "dark";

        gtk3.extraConfig = {
          gtk-toolbar-style = "GTK_TOOLBAR_ICONS";
          gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
          gtk-button-images = 0;
          gtk-menu-images = 0;
          gtk-xft-antialias = 1;
          gtk-xft-hinting = 1;
          gtk-xft-hintstyle = "hintslight";
          gtk-xft-rgba = "rgb";
          gtk-enable-event-sounds = false;
          gtk-enable-input-feedback-sounds = false;
          gtk-error-bell = false;
        };

        gtk4 = {
          extraConfig = {
            gtk-enable-event-sounds = false;
            gtk-enable-input-feedback-sounds = false;
            gtk-error-bell = false;
          };
          extraCss = gtk4Css;
        };
      };
    };
}
