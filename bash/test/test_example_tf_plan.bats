#!/usr/bin/env bats
load '/opt/bats-test-helpers/bats-support/load.bash'
load '/opt/bats-test-helpers/bats-assert/load.bash'
load '/opt/bats-test-helpers/lox-bats-mock/stub.bash'

setup() {
  stub terraform \
      "'init -input=false' : echo 'I am stubbed for terraform init!'"
  if [ -d .terraform ] ; then rm -rf .terraform ; fi 

}

@test "init_tf function should remove dir .terraform if exists" {
  source example_tf_plan.sh
  mkdir .terraform
  run init_tf
  assert [ ! -d '.terraform' ]
}

@test "init_tf function should print message if dir. .terraform exists" {
  source example_tf_plan.sh
  mkdir .terraform
  run init_tf
  assert_output "unclean working dir, .terraform dir still exists. removing .terraform"
}


@test "init_tf function should not print output if .terraform not exists" {
  source example_tf_plan.sh
  run init_tf
  assert_output ""
}
