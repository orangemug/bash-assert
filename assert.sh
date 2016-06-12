#!/bin/bash
__assert ()
{
  E_PARAM_ERR=98
  E_ASSERT_FAILED=99

  lineno=`caller 1`

  if [[ $# < 3 || $# > 4 ]]
  then
    num=`expr $# - 1`
    >&2 echo "ERR: assert require 2 or 3 params, got $num"
    return $E_PARAM_ERR
  fi

  cmd="\"$2\" $3 \"$4\""

  if [ $# -eq 3 ]; then
    if [ "$2" "$3" ]
    then
      success="true"
    else
      success="false"
    fi
  else
    if [ "$2" "$3" "$4" ]
    then
      success="true"
    else
      success="false"
    fi
  fi

  if [ "$success" != "$1" ]
  then
    >&2 echo "Assertion failed:  \"$cmd\""
    >&2 echo "File \"$0\", line $lineno"
    return $E_ASSERT_FAILED
  fi
}

assert() {
  __assert "true" "$@";
  return $?
}

assert_fail() {
  __assert "false" "$@";
  return $?
}
