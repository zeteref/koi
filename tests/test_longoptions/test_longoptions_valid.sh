#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_longoption_valid_singular {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_longoption_valid_multiple {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text"
	koi::addarg "-b" "--bbb" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa $bbb"
}

function test_longoption_valid_contains_number {
	koi::addarg "-a" "--a0" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$a0"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_longoption_valid_singular arg "--aaa" "arg"
	runtest test_longoption_valid_multiple "arg barg" "--aaa" "arg" "--bbb" "barg"
	runtest test_longoption_valid_contains_number arg "--a0" "arg"
}