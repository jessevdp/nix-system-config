{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    extraConfig = ''
      UseKeychain yes
    '';
  };
}
