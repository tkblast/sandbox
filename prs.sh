#!/bin/sh

############################### this script will do 4 things
## lists the merged PRs of the repo you’re in, as number title
## lets you pick one with fzf
## opens it with gh pr view
## exits cleanly if you press Esc: no error, and no gh pr view of the wrong PR

## check for dependancies
for cmd in gh fzf; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        printf '%s: %s not found\n' "$0" "$cmd" >&2
        exit 1
    fi
done

prs=$(gh pr list --state merged --limit 1000 --json number,title \
    --jq '.[] | "\(.number) \(.title)"') || exit "$?"
[ -n "$prs" ] || exit 0

if selection=$(printf '%s\n' "$prs" | fzf --no-multi ); then
    [ -n "$selection" ] || exit 0
    gh pr view "${selection%% *}"
else
    status=$?
    case $status in
        1|130) exit 0 ;;
        *) exit "$status" ;;
    esac
fi
