#!/bin/bash

source_dir="."
destination_dir="./dist/"

# Function to slugify the filename
slugify() {
    local str="$1"
    # Remove any characters that are not alphanumeric, dot, underscore, or dash
    slug="${str//[^a-zA-Z0-9._-]/-}"
    # Remove multiple dashes and trailing dashes, if any
    slug=$(echo "$slug" | sed 's/-\+/-/g; s/-$//')
    # Convert the slug to lowercase
    slug=$(echo "$slug" | tr '[:upper:]' '[:lower:]')
    echo "$slug"
}

# Loop through the files in the source directory
for file in "$source_dir"/*.md; do
    if [[ -f "$file" ]]; then
        # Extract the filename and extension
        filename=$(basename "$file")
        extension="${filename##*.}"

        # Slugify the filename to be web-friendly
        slug_filename=$(slugify "$filename")

        # Copy the file to the destination directory with the new name
        cp "$file" "$destination_dir/$slug_filename"
    fi
done
