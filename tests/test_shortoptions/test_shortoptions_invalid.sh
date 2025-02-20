#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_shortoption_invalid_non_alphanumeric_shortoption {
	koi::addarg "-_" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_shortoption_invalid_non_unique_shortoptions {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text"
	koi::addarg "-a" "--bbb" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa $bbb"
}

function test_shortoption_invalid_number_shortoptions {
	koi::addarg "-9" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_shortoption_invalid_invalid_length_long {
	koi::addarg "-aaa" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_shortoption_invalid_invalid_length_short {
	koi::addarg "-" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_shortoption_invalid_invalid_no_dash {
	koi::addarg "a" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_shortoption_invalid_invalid_more_than_one_dash {
	koi::addarg "--aaa" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_shortoption_invalid_non_alphanumeric_shortoption __error__ "-_" "arg"
	runtest test_shortoption_invalid_non_unique_shortoptions __error__ "-a" "arg" "-a" "arg"
	runtest test_shortoption_invalid_number_shortoptions __error__ "-9" "arg"
	runtest test_shortoption_invalid_invalid_length_long __error__ "-aaa" "arg"
	runtest test_shortoption_invalid_invalid_length_short __error__ "-" "arg"
	runtest test_shortoption_invalid_invalid_no_dash __error__ "a" "arg"
	runtest test_shortoption_invalid_invalid_more_than_one_dash __error__ "--aaa" "arg"
}