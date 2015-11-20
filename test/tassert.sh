#!/bin/bash
dir="$(dirname "$0")"

stdout="$(cat $dir/data/stdout.txt)"
stderr="$(cat $dir/data/stderr.txt)"

source $dir/../assert.sh
rslt_stdout=$($dir/../tassert.sh $dir/tassert-sample.sh 2> /dev/null)
rslt_stderr=$($dir/../tassert.sh $dir/tassert-sample.sh 2>&1 >/dev/null)

assert "$stdout" == "$rslt_stdout"
assert "$stderr" == "$rslt_stderr"
