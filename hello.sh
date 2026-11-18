#!/bin/sh
# hello.sh: greet someone by name (default: "world").
# pi is awesome
set -eu

usage() {
    printf 'Usage: %s [-h|--help] [name]\n' "$0"
}

# Check for help first, so "-h" works even when extra arguments follow it.
case "${1:-}" in
    -h|--help)
        usage
        exit 0
        ;;
esac

# Accept at most one argument (the name).
if [ "$#" -gt 1 ]; then
    usage >&2
    exit 2
fi

# An empty name falls back to the default too (":-" rather than "-").
name=${1:-world}
printf 'hello, %s\n' "$name"
