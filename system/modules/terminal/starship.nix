{lib, ...}: {
  programs.starship = {
    enable = true;

    settings = {
      add_newline = true;
      command_timeout = 400;
      scan_timeout = 30;

      aws = {
        format = "\\[[$symbol($profile )(\($region\))]($style)\\] ";
        style = "bold blue";
        symbol = " ";
      };

      azure = {
        style = "blue bold";
        symbol = "󰠅 ";
        format = "on [$symbol($subscription)]($style) ";
        disabled = false;
      };

      character = {
        success_symbol = "[](bold green)";
        error_symbol = "[](bold red)";
      };

      format = lib.concatStrings [
        "$sudo"
        "$directory"
        "$hostname"
        "\${custom.git_remote}"
        "$git_branch"
        "$git_state"
        "$git_metrics"
        "$nix_shell"
        "$kubernetes"
        "$terraform"
        "$aws"
        "$azure"
        "\n$character"
      ];

      cmd_duration = {
        min_time = 200;
        show_milliseconds = false;
        format = "it took [$duration]($style) ";
      };

      directory = {
        truncation_length = 2;
        truncate_to_repo = false;
        read_only = "";
        read_only_style = "#454343";
        style = "#8d3beb";
      };

      git_branch = {
        symbol = " ";
        style = "#ebb63b";
      };

      git_metrics = {
        disabled = false;
      };

      hostname = {
        ssh_only = false;
        ssh_symbol = "🌐 ";
        format = "\\[[$hostname](bold #db2c75)\\] ";
        trim_at = ".local";
        disabled = false;
      };

      kubernetes = {
        symbol = "󱃾";
        format = "\\[[$symbol $context( \($namespace\))]($style)\\] ";
        style = "cyan bold";
        disabled = false;
      };

      terraform = {
        symbol = "󱁢";
        format = "[$symbol $workspace]($style) ";
        detect_extensions = ["tf" "tfplan" "tfstate"];
        detect_folders = [".terraform"];
        disabled = false;
      };

      nix_shell = {
        symbol = " ";
        style = "#c07bed";
        impure_msg = "dev shell";
        pure_msg = "pure dev shell";
        format = " with [$symbol$state]($style) ";
      };

      sudo = {
        style = "bold red";
        disabled = false;
        format = "[$symbol]($style)";
        symbol = "󰭩 ";
      };
    };
  };
}
