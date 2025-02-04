{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    _1password-cli
  ];
  homebrew.casks = [
    "1password"
  ];
}
