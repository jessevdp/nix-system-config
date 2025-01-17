{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      UseKeychain yes
      AddKeysToAgent yes
    '';
  };
}
