#!/usr/bin/env bash

get_absolute_path() {
    local target="$1"
    local base="${target%/*}"
    local filename="${target##*/}"

    # If the path has no slashes, it's in the current directory
    if [ "$base" = "$target" ]; then
        base="."
    fi

    # Resolve the existing part of the path, then append the rest
    if [ -d "$base" ]; then
        echo "$(cd "$base" && pwd)/$filename"
    else
        # Fallback if even the parent directory chain doesn't exist
        echo "$PWD/$target"
    fi
}

SOURCE_URL="${1}"
OUTPUT_FILENAME=$(get_absolute_path "${2}")

# Change to the directory containing this script to ensure relative
# paths are resolved correctly
cd `dirname "${0}"`

npx vivliostyle build --output ${OUTPUT_FILENAME} ${SOURCE_URL}
