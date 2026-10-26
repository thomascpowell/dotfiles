{
  flake.homeModules.slop =
    { lib, pkgs, config, ... }:
    let
      notify = app: msg: {
        type = "command";
        command = lib.escapeShellArgs [
          "notify-send"
          "--app-name"
          app
          "--expire-time"
          "1000"
          msg
        ];
        timeout = 2;
      };

      mkHook =
        wrap: app: msg:
        wrap (notify app msg);

      codexHook = mkHook (action: [ { notify = [ action ]; } ]) "Codex";
      claudeHook = mkHook (action: [ { hooks = [ action ]; } ]) "Claude";

    in
    {
      programs.claude-code = {
        enable = true;
        package = pkgs.claude-code;
        configDir = "${config.xdg.configHome}/claude";
        settings = {
          hooks = {
            Notification = claudeHook "Notification";
            Stop = claudeHook "Stopped";
          };
          env = {
            CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY = "1";
            DISABLE_AUTOUPDATER = "1";
            DISABLE_ERROR_REPORTING = "1";
            DISABLE_INSTALLATION_CHECKS = "1";
            DISABLE_TELEMETRY = "1";
          };
          permissions = {
            allow = [
              "Bash(git diff*)"
              "Bash(git status)"
              "Bash(git status*)"
              "Bash(nix flake check*)"
            ];
            deny = [
              "Bash(rm -rf *)"
              "Bash(sudo *)"
              "Bash(git push*)"
              "Bash(git commit*)"
              "Bash(git add*)"
              "Bash(curl *)"
              "Bash(wget *)"
              "Bash(ssh *)"
              "Bash(scp *)"
              "Read(**/.env*)"
              "Read(**/.ssh/**)"
              "Read(**/.aws/**)"
              "Read(**/.gnupg/**)"
              "Read(**/*.pem)"
            ];
            disableBypassPermissionsMode = "disable";
          };
        };
      };

      programs.codex = {
        enable = true;
        hooks = {
          PermissionRequest = codexHook "PermissionRequest";
          Stop = codexHook "Stopped";
          Interrupt = codexHook "Interrupted";
        };
      };
    };
}
