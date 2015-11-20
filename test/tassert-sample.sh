#!/bin/bash
tassert 1 -eq 1
tassert 1 -eq 2

tassert "foo" == "foo"
tassert "foo" == "bar"

tassert "foo" != "bar"
tassert "foo" != "foo"

tassert "foo bar" == "foo bar"
tassert "foo bar" == "foo baz"
tend
