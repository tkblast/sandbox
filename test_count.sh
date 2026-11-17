#!/bin/sh
# Test that count.sh prints 1 to 5, one per line.

cd "$(dirname "$0")" || exit 1

expected="1
2
3
4
5"

if ! actual=$(sh ./count.sh); then
  echo "FAIL: count.sh exited with non-zero status" >&2
  exit 1
fi

if [ "$actual" != "$expected" ]; then
  echo "FAIL: count.sh output did not match" >&2
  echo "--- expected" >&2
  echo "$expected" >&2
  echo "--- actual" >&2
  echo "$actual" >&2
  exit 1
fi

echo "PASS: count.sh prints 1 to 5"
