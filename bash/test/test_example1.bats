#!/usr/bin/env bats
load '/opt/bats-test-helpers/bats-support/load.bash'
load '/opt/bats-test-helpers/bats-assert/load.bash'
load '/opt/bats-test-helpers/lox-bats-mock/stub.bash'

setup() {
    if [ -e colors.conf ] ; then rm -f colors.conf ; fi 
}

@test "func1 function should return 1" {
  source /code/example1.sh
  run func1
  [ "$status" -eq 1 ]  
}

@test "func1 function should return 2" {
  source /code/example1.sh
  run func1
  [ "$status" -eq 2 ]  
}

@test "func2 function should create config file is grass is green" {
  source example1.sh
  ENV_GRASS="green"
  run func2
  assert [ -e 'colors.conf' ]
}


@test "func2 function should not create config file if grass is not green" {
  source example1.sh
  ENV_GRASS="red"
  run func2
  assert [ ! -e 'colors.conf' ]
}

