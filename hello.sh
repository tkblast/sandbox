#!/bin/sh
set -eu
# pi is awesome

usage() {
    printf 'Usage: %s [-h|--help] [name]\n' "$0"
}

case "${1:-}" in
    -h|--help) usage; exit 0 ;;
esac

if [ "$#" -gt 1 ]; then
    usage >&2
    exit 2
fi

printf 'hello, %s\n' "${1:-world}"
