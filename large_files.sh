#!/bin/sh

large_files() {
  iSize=1G
  if [ $# -gt 0 ]; then
    iSize=$1
  fi
  # Find files and directories > 1G
  sudo du -h --max-depth=3 --threshold=$iSize --exclude=/disks --exclude=/c4shares --exclude=/net / 2> /dev/null | sort -hr
}

large_files "$@"
