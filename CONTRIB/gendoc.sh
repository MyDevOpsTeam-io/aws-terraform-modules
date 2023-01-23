#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./gendoc.sh <module/foldername>"
else
  pushd "$1" >> /dev/null || exit
  terraform fmt
  terraform validate
  terraform-docs markdown table . --output-file README.md --output-mode inject
  popd >> /dev/null || exit
fi
