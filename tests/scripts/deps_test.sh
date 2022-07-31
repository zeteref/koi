#!/bin/bash

source ../../koi
koiname=deps_test.sh
koidescription='Example of dependent arguments'

function testfunc {
	koi::addarg "-h" "--help" "help" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storevalue" "optional" "" "help text"
	koi::addarg "-b" "--barg" "storevalue" "optional" "" "help text"
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "XOR" "optional" "--flag" "--glad"
	koi::adddep "--flag" "--glad" "dependson" "--arg"
	koi::adddep "--flag" "dependson" "--barg"
	koi::adddep "--glad" "dependson" "--barg"
	koi::parseargs "$@"

	echo "arg:  $arg"
	echo "barg: $barg"
	echo "flag: $flag"
	echo "glad: $glad"
}

koi::koirun "$@"
