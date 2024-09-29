{
  users = {
    groups.admin = {};

    users.luisnquin = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      # Try to use age
      hashedPassword = "$y$j9T$VZMu2I9/ZfWvX1qcvX2d41$0Xpxq/.5dq9zdjwUA//GHXXcgQSTCxxnhc5b5.fvGgC";
      group = "admin";
    };
  };
}
