#!/bin/bash
set -e

source ../../koi
koiname=verifyingfunction_example.sh
koidescription="Examples of verifying functions"

function run {
	koi::addarg "-h" "--help" "help" "optional" "" "Help text"
	koi::addarg "" "file" "positionalarray" "required" "" "A file argument" "koi::verifyfiletype json"
	koi::parseargs "$@"

	for f in "${file[@]}" ; do
		echo "File: $f"
	done
}

koi::run "$@"