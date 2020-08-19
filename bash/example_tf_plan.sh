#!/usr/bin/env sh

init_tf() {
  if [ -d ".terraform" ]; then
    echo "unclean working dir, .terraform dir still exists. removing .terraform"
    rm -rf .terraform
  fi

  terraform init -input=false
}
