#!/bin/bash

SOURCE_DIR="$(b=${BASH_SOURCE[0]}; dirname $(readlink $b || echo $b))"
source "$SOURCE_DIR"/hello_goodbye.sh

# TESTS
function test_hello_world () {
   assertEquals "test hello method"    "hello world"  "$(hello)"
   assertEquals "test hello method"    "hello earth"  "$(hello earth)"
}

function test_goodbye () {
   assertEquals "test goodbye method"  "goodbye"      "$(goodbye)"
}

# CONFIG
HARKNESS_TESTS=(
   test_hello_world
   test_goodbye
)
