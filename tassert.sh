#!/bin/bash
source "${BASH_SOURCE[0]}/../assert.sh"

set +e


GRAY='\033[0;37m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

__color () {
  echo "${1}${2}${NC}"
}

__tassert_help () {
>&2 cat << END
Usage: $0 <path>
END
}

if [ $# -lt 1 ]
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

__shorten_string () {
  out="${1:0:$2}"
  if [[ "$out" != "$1" ]]; then
    echo "${out}…" | awk 'BEGIN{ORS="\\\\n"} {print $0}'
  else
    echo $out
  fi
}


printf "$(__color $GRAY "TAP version 13")\n" 1>&3
ASSERT_TESTS_RUN=0;


__tassert_tap () {
  prefix=$1
  err=$2
  cmd="\"$3\" $4 \"$5\""
  short_cmd="\"$(__shorten_string "$3" 20)\" $4 \"$(__shorten_string "$5" 20)\""

  if [ $err -lt 1 ]
  then
    printf "$(__color $GREEN ok) $ASSERT_TESTS_RUN - [$prefix] $short_cmd\n" 1>&3
  else
    printf "$(__color $RED not) ok $ASSERT_TESTS_RUN - [$prefix] $cmd\n" 1>&3
  fi

  return $err
}

tassert () {
  ASSERT_TESTS_RUN=$((ASSERT_TESTS_RUN + 1));
  assert "$@"
  __tassert_tap "assert" $? "$@"
  return $?
}

tassert_fail () {
  ASSERT_TESTS_RUN=$((ASSERT_TESTS_RUN + 1));
  assert_fail "$@" 2>&1
  __tassert_tap "assert_fail" $? "$@"
  return $?
}

{
  for file in "$@";
  do
    source "$file"
  done
} 2>&1 | sed -e 's/^/# /'
