#!/usr/bin/env bash


HERE="$(dirname "$(readlink -f "${0}")")"

sudo nix-collect-garbage -d
$HERE/update.sh
