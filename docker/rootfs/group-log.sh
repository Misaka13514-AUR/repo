#!/bin/bash
set -e

LOG_DIR=${LOG_DIR:-"/home/lilac/.lilac/log"}
LOG_DIR=$(realpath "$LOG_DIR")

if [[ ! -d "$LOG_DIR" ]]; then
  echo "Log directory $LOG_DIR does not exist."
  exit 1
fi

# Find all log files, sort with lilac-main.log first
find "$LOG_DIR" -type f | while read -r file; do
  filename=$(basename "$file")
  dirname=$(basename "$(dirname "$file")")

  if [[ "$filename" == "lilac-main.log" ]]; then
    priority=1
  else
    priority=2
  fi

  printf "%d\t%s\t%s\n" "$priority" "$dirname" "$file"
done | sort | while IFS=$'\t' read -r _ dirname filepath; do
  fname=$(basename "$filepath")
  echo "::group::[$dirname] $fname"
  cat "$filepath"
  echo "::endgroup::"
done
