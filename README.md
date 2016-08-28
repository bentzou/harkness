# Harkness

## Summary
Harkness is a test harness for Bash scripts.

### Example

You have the following functions in a script named `hello_goodbye.sh`.

``` bash
function hello () {
   if [ -n "$1" ]; then
      echo "hello $1"
   else
      echo "hello world"
   fi
}

function goodbye () {
   echo "goodbye"
}
```

Write your test cases in the below format.
``` bash
# RESOURCES
# Source your functions however you like.

SOURCE_DIR="$(b=${BASH_SOURCE[0]}; dirname $(readlink $b || echo $b))"
source "$SOURCE_DIR"/hello_goodbye.sh

# TESTS
# Specify tests as functions.

function test_hello_world () {

	# Specify assertions in the format: assertEquals "description" "expected" "actual"
   assertEquals "test hello method"    "hello world"  "$(hello)"
   assertEquals "test hello method"    "hello earth"  "$(hello earth)"
}

function test_goodbye () {
   assertEquals "test goodbye method"  "goodbye"      "$(goodbye)"
}

# CONFIGURATION
# Specify the functions that are tests.

HARKNESS_TESTS=(
   test_hello_world
)
```

Run your tests.
``` bash
$> ./harkness helloworld_test.sh
HARKNESS TEST SUITE

TEST: test_hello_world
   success -- test hello method:  'hello world' == 'hello world'
   success -- test hello method:  'hello earth' == 'hello earth'
   PASSED: 2/2 assertions

TEST: test_goodbye
   success -- test goodbye method:'goodbye' == 'goodbye'
   PASSED: 1/1 assertions

SUMMARY
   ASSERTS PASSED: 3/3
   TESTS PASSED: 2/2
```
