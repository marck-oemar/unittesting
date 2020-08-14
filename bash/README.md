# Unit testing BASH scripts with BATS

[BATS](https://github.com/bats-core/bats-core) stands for BASH Automated Testing System. It's a [TAP](https://testanything.org/)-compliant testing framework for Bash. 
It provides a simple way to verify that the UNIX programs you write behave as expected.

## Bash is challenging as a programming language
My opinion is that Bash is challenging as a programming language, especially variable scope and isolation or implementation of functions. 
This makes [unit testing](https://en.wikipedia.org/wiki/Unit_testing) in Bash challenging.

## Prepare
We're using a docker container as the testing environment. The container image includes bats and some bats-helpers: bats-support, bats-assert and bats-mock (by lox)

To build the container image execute:
```
clone_helpers_and_build_image.sh
```

This script will clone the bats-helpers git repositories in a temporary folder and build the container image, based on bats/bats.

## Tests
There are 2 example Bash scripts and for each there is a Bats test file that has certain assertions defined.
Pay attention to example_tf_plan which has stubbing involved. (https://martinfowler.com/bliki/TestDouble.html)

To execute the tests:
```
docker run -it -v "${PWD}:/code" bats-with-helpers:latest /code/test/test_example_tf_plan.bats
docker run -it -v "${PWD}:/code" bats-with-helpers:latest /code/test/test_example1.bats
```
