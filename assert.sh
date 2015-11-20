#!/bin/sh
__assert ()
{
  E_PARAM_ERR=98
  E_ASSERT_FAILED=99

  lineno=`caller 1`

  if [ $# == 2 ]
  then
    cmd="$2"
  elif [ $# == 4 ]
  then
    cmd="$2 $3 $4"
  else
    >&2 echo "ERR: assert require 1 or 3 params, got $#"
    return $E_PARAM_ERR
  fi

  success="true"

  if [ ! $cmd ]
  then
    success="false"
  fi

  if [ "$success" != "$1" ]
  then
    echo "Assertion failed:  \"$cmd\""
    echo "File \"$0\", line $lineno"
    return $E_ASSERT_FAILED
  fi
}

assert() {
  __assert "true" $1 $2 $3;
  return $?
}

assert_fail() {
  __assert "false" $1 $2 $3;
  return $?
}
