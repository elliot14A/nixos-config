# NixOS Configuration

Personal NixOS configuration with declarative secret management.

## Setup on New Machine

1. Install NixOS normally

2. Clone this repository:
```bash
git clone git@github.com:elliot14A/nixos-config.git ~/.config/nixos
cd ~/.config/nixos
```

3. Copy your age private key to the new machine:
```bash
mkdir -p ~/.config/sops/age
# Copy your keys.txt file from old machine to ~/.config/sops/age/keys.txt
chmod 600 ~/.config/sops/age/keys.txt
```

4. Apply configuration:
```bash
sudo nixos-rebuild switch --flake .#kiwi
```

## Structure

- `flake.nix` - Main flake configuration
- `devices/laptop/kiwi/` - Device specific config
- `modules/` - Shared NixOS modules  
- `home/` - Home manager configuration
  - `secrets/secrets.nix` - Defines which keys can decrypt which secrets
  - `secrets/keys/` - Encrypted secret files (safe to commit)

## Adding New Secrets

1. Add secret to `home/secrets/secrets.nix`:
```nix
{
  "keys/new-secret.age".publicKeys = [ kiwi ];
}
```

2. Create the encrypted file:
```bash
# This will open your editor to enter the secret
nix run github:ryantm/agenix -- -e home/secrets/keys/new-secret.age
```

3. Use in configuration:
```nix
{
  age.secrets.new-secret.file = ../home/secrets/keys/new-secret.age;
  # Reference with: config.age.secrets.new-secret.path  
}
```

## Security Notes

- Age private key (`~/.config/sops/age/keys.txt`) stays on local machine only
- Encrypted `.age` files are safe to commit to git
- Only machines with the private key can decrypt secrets
- SSH keys already on GitHub can decrypt using the same private keys