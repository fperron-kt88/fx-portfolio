#!/bin/bash
OUT="fx-portfolio-lite.zip"

echo "Creating $OUT without heavy or dev-only files..."

zip -r "$OUT" . \
  -x "_site/*" \
  -x ".jekyll-cache/*" \
  -x ".git/*" \
  -x "*.DS_Store" \
  -x "*.swp" \
  -x "*.swo" \
  -x "*.tags" \
  -x "jekyll_collated_files.txt" \
  -x "fx-portfolio.zip" \
  -x "fx-portfolio-lite.zip" \
  -x "assets/images/*" \
  -x "assets/docs/*" \
  -x "assets/fonts/*" \
  -x "assets/theme/images/*"

echo "Done. Created $OUT"

