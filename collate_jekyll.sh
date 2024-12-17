#!/bin/bash

# Output file to hold the collated content
COLLATED_FILE="jekyll_collated_files.txt"

# List of files and directories to include
INCLUDE_LIST=(
  "_config.yml"
  "Gemfile"
  "Gemfile.lock"
  "assets/theme/css/style.scss"
  "assets/theme/css/ie.scss"
  "_layouts/default.html"
  "_includes/head-custom.html"
  "_pages/about.md"
  "_pages/portfolio.md"
  "index.md"
  "README.md"
)

# Create a fresh output file
> "$COLLATED_FILE"

echo "Collating files into $COLLATED_FILE..."

# Loop through the files and directories, appending their content
for ITEM in "${INCLUDE_LIST[@]}"; do
  if [ -f "$ITEM" ]; then
    echo -e "\n\n===========================" >> "$COLLATED_FILE"
    echo "FILE: $ITEM" >> "$COLLATED_FILE"
    echo "===========================" >> "$COLLATED_FILE"
    cat "$ITEM" >> "$COLLATED_FILE"
  elif [ -d "$ITEM" ]; then
    echo -e "\n\n===========================" >> "$COLLATED_FILE"
    echo "DIRECTORY: $ITEM" >> "$COLLATED_FILE"
    echo "===========================" >> "$COLLATED_FILE"
    find "$ITEM" -type f | while read -r FILE; do
      echo -e "\n\n--- FILE: $FILE ---" >> "$COLLATED_FILE"
      cat "$FILE" >> "$COLLATED_FILE"
    done
  else
    echo "Skipping missing item: $ITEM"
  fi
done

echo "Done! All content is now in $COLLATED_FILE."

# Display a message
echo "You can open $COLLATED_FILE and copy its content here."

