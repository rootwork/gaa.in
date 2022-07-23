#!/bin/sh

# USAGE:
# ./generate.sh states.txt

# Read in list
list=$1
[ ! -f "$list" ] && {
  echo "$0 - File $list not found."
  exit 1
}

while IFS= read -r state; do
  # Generate filenames
  file=$(echo "$state" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
  file="content/en/$file.md"

  cat >"$file" <<EOF
---
title: "$state"
description: "Information on abortion and reproductive health services."
---

EOF
done <"$list"
