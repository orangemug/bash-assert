#!/bin/sh
source assert.sh

set +e

__tassert_help () {
>&2 cat << END
Usage: $0 <path>
END
}

if [ $# -ne 1 ]
then
  >&2 echo "Require 1 argument got $#"
  exit 1
fi

if [ \( $1 == "--help" \) -o \( $1 == "--h" \) ]
then
  __tassert_help
  exit 1
fi

testfile=$1;

if [ ! -f "$testfile" ]
then
  >&2 echo "Missing file: $testfile"
  exit 2
fi

exec 3>&2

__tassert_tap () {
  err=$1
  cmd="$2 $3 $4"

  if [ $err -lt 1 ]
  then
    echo "ok $ASSERT_TESTS_RUN - \"$cmd\"" 1>&3
  else
    echo "not ok $ASSERT_TESTS_RUN - \"$cmd\"" 1>&3
  fi

  return $err
}

echo "TAP version 13" 1>&3
export ASSERT_TESTS_RUN=0;

tassert () {
  ASSERT_TESTS_RUN=$((ASSERT_TESTS_RUN + 1));
  assert "$@"
  __tassert_tap $? "$@"
  return $?
}

tassert_fail () {
  ASSERT_TESTS_RUN=$((ASSERT_TESTS_RUN + 1));
  assert_fail "$@" 2>&1
  __tassert_tap $? "$@"
  return $?
}

tend () {
  echo "1..$ASSERT_TESTS_RUN" 1>&3
}

source $testfile 2>&1 | sed -e 's/^/# /'

