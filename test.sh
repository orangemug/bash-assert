source assert.sh

set -e

assert 1 -eq 1
assert_fail 1 -eq 2

assert "foo" == "foo"
assert_fail "foo" == "bar"

assert "foo" != "bar"
assert_fail "foo" != "foo"
