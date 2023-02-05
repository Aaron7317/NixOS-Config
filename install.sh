#!/usr/bin/env bash

HERE="$(dirname "$(readlink -f "${0}")")"

printf "Please select target:\n"
select d in $HERE/hosts/*/; do test -n "$d" && break; echo ">>> Invalid Selection"; done
TARGET="$(basename $d)"

sudo nixos-install --flake "$HERE#$TARGET"
