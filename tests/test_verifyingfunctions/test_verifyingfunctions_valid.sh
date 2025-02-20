#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_verifyingfunction_valid_no_arguments {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text" "__verifyingfunction"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_verifyingfunction_valid_arguments {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text" "__verifyingfunctionargs"
	koi::parseargs "$@"
}

function test_verifyingfunction_valid_blank {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function __verifyingfunction {
	:
}

function __verifyingfunctionargs {
	echo "123"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_verifyingfunction_valid_no_arguments "arg" "-a" "arg"
	runtest test_verifyingfunction_valid_arguments "123" "-a" "arg"
	runtest test_verifyingfunction_valid_blank "arg" "-a" "arg"
}