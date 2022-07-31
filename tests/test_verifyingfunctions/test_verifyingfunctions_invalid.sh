#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_verifyingfunction_invalid_not_defined {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text" "mycoolfunction"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_verifyingfunction_invalid_help {
	koi::addarg "-h" "--help" "help" "optional" "" "help text" "__verifyingfunction"
	koi::parseargs "$@"
	echo "$help"
}

function test_verifyingfunction_invalid_flag {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text" "__verifyingfunction"
	koi::parseargs "$@"
	echo "$flag"
}

function __verifyingfunction {
	:
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_verifyingfunction_invalid_not_defined __error__ "-a" "arg"
	runtest test_verifyingfunction_invalid_help __error__ "-h"
	runtest test_verifyingfunction_invalid_flag __error__ "-f"
}