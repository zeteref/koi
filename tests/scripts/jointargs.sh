#!/bin/bash

source ../../koi
koiname=jointargs.sh
koidescription="Testing joint arguments"

function testfunc {
	koi::addarg "-h" "--help" "help" "optional" "" "help text"
	koi::addarg "" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::parseargs "$@"
	echo "flag: $flag"
	echo "glad: $glad"
}

koi::koirun "$@"
