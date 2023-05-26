#!/usr/bin/env bash

# Rebuild the development shell
# --build will run only the build phase
# --accept-flake-config will accept the nix configuration from the flake without prompting
# --impure is needed by devenv
nix develop \
	--build \
	--accept-flake-config \
	--impure
