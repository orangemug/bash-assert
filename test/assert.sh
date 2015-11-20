#!/bin/sh
dir="$(dirname "$0")"
source $dir/../assert.sh

set -e

assert 1 -eq 1
assert_fail 1 -eq 2

assert "foo" == "foo"
assert_fail "foo" == "bar"

assert "foo" != "bar"
assert_fail "foo" != "foo"

assert "foo bar" == "foo bar"
assert_fail "foo bar" == "foo baz"
