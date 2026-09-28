# Bazzite Nix NVIDIA

Minimal custom Bazzite KDE image for newer NVIDIA GPUs. It adds an empty
`/nix` directory to the immutable image, allowing the Determinate Nix
installer to bind-mount the persistent store at `/var/home/nix` without
modifying the immutable root at runtime. The NVIDIA base uses NVIDIA's open
kernel modules alongside its proprietary user-space driver components.

The image deliberately contains no additional packages. It tracks
`bazzite-nvidia-open:stable` and is rebuilt daily by GitHub Actions, so normal
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
