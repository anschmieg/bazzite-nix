#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### This image intentionally adds no packages.
# Nix itself remains managed by the host-side Determinate installer; this
# image only supplies the persistent mountpoint required by immutable Bazzite.
