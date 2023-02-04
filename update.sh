#!/usr/bin/env bash

HERE="$(dirname "$(readlink -f "${0}")")"

printf "Please select folder:\n"
select d in $HERE/hosts/*/; do test -n "$d" && break; echo ">>> Invalid Selection"; done
TARGET="$(basename $d)"

nix flake update $HERE
sudo nixos-rebuild switch --flake "$HERE#$TARGET"
