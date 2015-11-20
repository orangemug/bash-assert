dir="$(dirname "$0")"

stderr=`cat <<END
TAP version 13
ok 1 - "1 -eq 1"
not ok 2 - "1 -eq 2"
ok 3 - "foo == foo"
not ok 4 - "foo == bar"
ok 5 - "foo != bar"
not ok 6 - "foo != foo"
ok 7 - "foo bar == foo bar"
not ok 8 - "foo bar == foo baz"
1..8
END
`

stdout=`cat <<END
# Assertion failed:  ""1" -eq "2""
# File "./test/../tassert.sh", line 55 tassert ./test/../tassert.sh
# Assertion failed:  ""foo" == "bar""
# File "./test/../tassert.sh", line 55 tassert ./test/../tassert.sh
# Assertion failed:  ""foo" != "foo""
# File "./test/../tassert.sh", line 55 tassert ./test/../tassert.sh
# Assertion failed:  ""foo bar" == "foo baz""
# File "./test/../tassert.sh", line 55 tassert ./test/../tassert.sh
`

source $dir/../assert.sh
rslt_stdout=$($dir/../tassert.sh $dir/tassert-sample.sh 2> /dev/null)
rslt_stderr=$($dir/../tassert.sh $dir/tassert-sample.sh 2>&1 >/dev/null)

assert "$stdout" == "$rslt_stdout"
assert "$stderr" == "$rslt_stderr"
