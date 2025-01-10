## Setup (MacOS/Darwin)

Install Nix using the [installer from DeterminateSystems](https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#install-nix):

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

Install [Homebrew](https://brew.sh) (it will be [managed by nix-darwin](https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.enable):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

