{ lib, pkgs, ... }:

# Slop

let
  agentAttention = pkgs.writeShellApplication {
    name = "agent_attention";

    runtimeInputs = [
      pkgs.tmux
    ];

    text = ''
      action="''${1:-}"

      if [ -z "''${TMUX_PANE:-}" ]; then
        exit 0
      fi

      case "$action" in
        set)
          tmux set-option -w -t "$TMUX_PANE" @agent_attention 1 2>/dev/null || true
          ;;
        clear)
          tmux set-option -w -u -t "$TMUX_PANE" @agent_attention 2>/dev/null || true
          ;;
        *)
          exit 1
          ;;
      esac
    '';
  };

  hook = action: [
    {
      hooks = [
        {
          type = "command";
          command = "${lib.getExe agentAttention} ${action}";
          timeout = 2;
        }
      ];
    }
  ];

  codexWithAttention = pkgs.writeShellApplication {
    name = "codex";

    runtimeInputs = [
      agentAttention
      pkgs.codex
    ];

    text = ''
      cleanup() {
        agent_attention clear
      }
      trap cleanup EXIT
      ${lib.getExe pkgs.codex} "$@"
    '';
  };

in
{
  home.packages = [
    agentAttention
  ];

  programs.codex = {
    enable = true;
    package = codexWithAttention;

    hooks = {
      SessionStart = hook "clear";

      UserPromptSubmit = hook "clear";

      PermissionRequest = hook "set";
      PreToolUse = hook "set";
      PostToolUse = hook "clear";

      Stop = hook "set";
      Interrupt = hook "clear";
      SessionEnd = hook "clear";
    };
  };
}
