#!/bin/bash

which pre-commit >> /dev/null && export IS_PRECOMMIT_AVAILABLE="0"
if [[ "$IS_PRECOMMIT_AVAILABLE" != "0" ]]; then
  echo "[FAILED]: pre-commit cli is not available"
  echo "To install it, type: pip3 install pre-commit"
else
  echo "[FOUND]: pre-commit cli found!"
  if test -f "../.git/hooks/pre-commit"; then
    echo "File .git/hooks/pre-commit exists!"
  else
    echo "[INFO] Installing pre-commit script...."
    pushd ../ >> /dev/null && pre-commit install && popd >> /dev/null
  fi

fi
