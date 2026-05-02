{ config, ... }:

# Custom GTK/QT theme
# System-wide color palette was adapted from lackluster.nvim (MIT)

let
  path = "${config.home.homeDirectory}/dotfiles/theme";
in

{
  home.file.".config/gtk-3.0".source = ../config/gtk-3.0;
  home.file.".config/gtk-4.0".source = ../config/gtk-4.0;
  home.file.".themes/ll".source = ../theme/gtk;

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  home.file.".xprofile".text = ''
    export QT_QPA_PLATFORMTHEME=qt6ct
  '';

  home.file.".config/qt6ct/qt6ct.conf".text = ''
    [Appearance]
    color_scheme_path=${path}/qt6ct/colors/ll.conf
    custom_palette=true
    standard_dialogs=default
    style=Fusion

    [Fonts]
    fixed="SF Pro Text,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular,0,0"
    general="SF Pro Text,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular,0,0"

    [Interface]
    activate_item_on_single_click=1
    buttonbox_layout=0
    cursor_flash_time=1000
    dialog_buttons_have_icons=1
    double_click_interval=400
    gui_effects=@Invalid()
    keyboard_scheme=2
    menus_have_icons=true
    show_shortcuts_in_context_menus=true
    stylesheets=@Invalid()
    toolbutton_style=4
    underline_shortcut=1
    wheel_scroll_lines=3

    [SettingsWindow]
    geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\x3\xc6\0\0\0)\0\0\as\0\0\x4\xa3\0\0\0\f\0\0\0)\0\0\as\0\0\x4\xa3\0\0\0\0\x2\0\0\0\a\x80\0\0\x3\xc6\0\0\0)\0\0\as\0\0\x4\xa3)

    [Troubleshooting]
    force_raster_widgets=1
    ignored_applications=@Invalid()
  '';

  home.file.".config/qt5ct/qt5ct.conf".text = ''
    [Appearance]
    color_scheme_path=${path}/qt5ct/colors/ll.conf
    custom_palette=true
    standard_dialogs=gtk3
    style=Fusion

    [Fonts]
    fixed="SF Pro Text,10,-1,5,50,0,0,0,0,0"
    general="SF Pro Text,10,-1,5,50,0,0,0,0,0"

    [Interface]
    activate_item_on_single_click=1
    buttonbox_layout=0
    cursor_flash_time=1000
    dialog_buttons_have_icons=1
    double_click_interval=400
    gui_effects=@Invalid()
    keyboard_scheme=2
    menus_have_icons=true
    show_shortcuts_in_context_menus=true
    stylesheets=@Invalid()
    toolbutton_style=4
    underline_shortcut=1
    wheel_scroll_lines=3

    [SettingsWindow]
    geometry="@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\x5\xa9\0\0\0=\0\0\v-\0\0\x6\xf5\0\0\0\x12\0\0\0=\0\0\x3\xb6\0\0\x6\xf5\0\0\0\0\x2\0\0\0\v@\0\0\x5\xa9\0\0\0=\0\0\v-\0\0\x6\xf5)"

    [Troubleshooting]
    force_raster_widgets=1
    ignored_applications=@Invalid()
  '';

}
