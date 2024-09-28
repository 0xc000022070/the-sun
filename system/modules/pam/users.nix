{
  users = {
    groups.admin = {};

    users.luisnquin = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      # Try to use age
      hashedPassword = "$y$j9T$SNio8sW7C2NoGBbErRqEq0$YNs/TCv4qkcKwHqDoSr/O1qra.GLyjnElc/dgtIT0P9";
      group = "admin";
    };
  };
}
