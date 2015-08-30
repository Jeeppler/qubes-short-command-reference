#! /usr/bin/env bash

INPUT_MD="$1"
OUTPUT="$2"
METADATA="metadata.yaml"

# outputs a PDF file
pandoc "$METADATA" "$INPUT_MD" -s -o "$OUTPUT".pdf

# outputs a HTML (HTML5) file
pandoc "$METADATA" "$INPUT_MD" -s -S -t html5 -o "$OUTPUT".html

# outputs a plain text
pandoc "$INPUT_MD" -s -S -t plain -o "$OUTPUT".txt
