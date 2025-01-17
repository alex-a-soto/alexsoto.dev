#!/usr/bin/env bash
set -euo pipefail

ZETTEL="${1:?Zettel file must be provided}"
NEW_NAME="${2:?Zettel new name must be provided}"

if [[ "$ZETTEL" == *.md ]]; then
    ZETTEL="${ZETTEL%.md}"
fi

if [[ "$NEW_NAME" == *.md ]]; then
    NEW_NAME="${NEW_NAME%.md}"
fi

if [[ ! -f "$ZETTEL.md" ]]; then
    echo "File '$ZETTEL.md' does not exist." >&2
    exit 1
fi

if [[ -f "$NEW_NAME.md" ]]; then
    echo "File '$NEW_NAME.md' already exist." >&2
    exit 1
fi

mv "$ZETTEL.md" "$NEW_NAME.md"
sed -i "s/\[\[$ZETTEL\]\]/[[$NEW_NAME]]/g" ./*.md

#git add .
#git commit -m "Renamed $ZETTEL -> $NEW_NAME"
