{
  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;

    extraRules = [
      {
        users = ["luisnquin"];
        commands = [
          {
            command = "/run/current-system/sw/bin/poweroff";
            options = ["NOPASSWD"];
          }
          {
            command = "/run/current-system/sw/bin/reboot";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
  };
}
