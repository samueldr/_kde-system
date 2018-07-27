#!/usr/bin/env bash

set -e
set -u
PS4=" $ "
set -x

env -i \
	PATH="$PATH" \
	NIX_PATH=nixpkgs="$HOME"/tmp/nixpkgs/nixpkgs-qt:nixos-config="$PWD"/configuration.nix \
	nixos-rebuild build-vm

./result/bin/run-nixos-vm
