#!/bin/bash
set -e

source ../../koi
koiname=koimain_example.sh
koidescription="Examples of running koi without subcommands via __koimain"

function __koimain {
	koi::addarg "-h" "--help" "help" "optional" "" "$koidescription"
	koi::addarg "-m" "--myval" "storevalue" "optional" "abc" "An optional argument"
	koi::addarg "" "myarg" "positionalvalue" "optional" "" "An optional positional argument"
	koi::addarg "-f" "--myflag" "flag" "optional" "" "An optional flag"
	koi::parseargs "$@"

	echo "myval: $myval"
	echo "myarg: $myarg"
	echo "myflag: $myflag"
}

koi::koirun "$@"