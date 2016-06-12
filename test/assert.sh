#!/bin/bash
dir="$(dirname "$0")"
source $dir/../assert.sh

set -e

# Number
assert 1 -eq 1
assert_fail 1 -eq 2

assert_fail 1 -ne 1
assert 1 -ne 2

assert_fail 1 -gt 1
assert 2 -gt 1

assert_fail 0 -ge 1
assert 1 -ge 1

assert_fail 1 -lt 1
assert 0 -lt 1

assert_fail 1 -le 0
assert 1 -le 1


# Ascii
assert "foo" == "foo"
assert_fail "foo" == "bar"

assert "foo" != "bar"
assert_fail "foo" != "foo"

assert "foo bar" == "foo bar"
assert_fail "foo bar" == "foo baz"

assert -z ""
assert -a "$dir/../circle.yml"
assert -d "$dir/.."
assert -e "$dir/../circle.yml"
assert -f "$dir/../circle.yml"
assert -h "$dir/data/LICENSE"
assert -L "$dir/data/LICENSE"
assert "$dir/../LICENSE" -ef "$dir/data/LICENSE"

