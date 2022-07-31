#!/bin/bash
set -e

source ../../koi
koiname=mutex_example.sh
koidescription="Example of how to use groups with koi"

function testgroup {
	koi::addarg "-h" "--help" "help" "optional" "" "help text"
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "storevalue" "optional" "" "help text"
	koi::addarg "" "pos" "positionalvalue" "optional" "" "help text"
	koi::addgroup "flags" "AND" "required" "--glad" "--flag" "--vlad"
	koi::parseargs "$@"

	echo "flag: $flag"
	echo "glad: $glad"
}

function mixed {
	koi::addarg "-h" "--help" "help" "optional" "" "help text"
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storevalue" "optional" "" "help text"
	koi::addgroup "group" "XOR" "optional" "--flag" "--arg"
	koi::parseargs "$@"

	echo "flag: '$flag'"
	echo "arg: '$arg'"
}

function multiple {
  koi::addarg "-h" "--help" "help" "optional" "" "help text"
  koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
  koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
  koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
  koi::addgroup "flags1" "XOR" "required" "--flag" "--glad"
  koi::addgroup "flags2" "XOR" "required" "--glad" "--vlad"
  koi::parseargs "$@"

  echo "flag: '$flag'"
  echo "glad: '$glad'"
  echo "vlad: '$vlad'"
}

function array {
  koi::addarg "-h" "--help" "help" "optional" "" "help text"
  koi::addarg "-a" "--arr" "storearray" "optional" "" "help text"
  koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
  koi::addgroup "group" "XOR" "required" "--flag" "--arr"
  koi::parseargs "$@"

  echo "arr: ${arr[@]}"
  echo "flag: $flag"
}

koi::koirun "$@"
