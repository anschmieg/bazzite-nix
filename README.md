# Bazzite Nix

Minimal custom Bazzite KDE image that adds an empty `/nix` directory to the
immutable image. This allows the Determinate Nix installer to bind-mount the
persistent store at `/var/home/nix` without modifying the immutable root at
runtime.

The image deliberately contains no additional packages. Bazzite is tracked by
the `stable` base-image tag and rebuilt daily by GitHub Actions, so normal
system updates continue to use the standard atomic update and rollback model.

## Rebase

After the first successful build:

```bash
sudo rpm-ostree rebase ostree-image-signed:docker://ghcr.io/anschmieg/bazzite-nix:stable
systemctl reboot
```

Then install Nix normally:

```bash
curl --proto '=https' --tlsv1.2 -sSfL \
  https://install.determinate.systems/nix \
  | sudo sh -s -- install --no-confirm
```

Updates remain:

```bash
ujust update
```
