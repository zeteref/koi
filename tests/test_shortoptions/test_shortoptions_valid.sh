#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_shortoption_valid_no_shortoption_with_longoption_singular {
	koi::addarg "" "--long" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$long"
}

function test_shortoption_valid_no_shortoption_with_longoption_multiple {
	koi::addarg "" "--aaa" "storevalue" "optional" "" "help text"
	koi::addarg "" "--bbb" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa $bbb"
}

function test_shortoption_valid_valid_shortoption_singular {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_shortoption_valid_valid_shortoption_multiple {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text"
	koi::addarg "-b" "--bbb" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa $bbb"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_shortoption_valid_no_shortoption_with_longoption_singular long "--long" "long"
	runtest test_shortoption_valid_no_shortoption_with_longoption_multiple "arg barg" "--aaa" "arg" "--bbb" "barg"
	runtest test_shortoption_valid_valid_shortoption_singular arg "-a" "arg"
	runtest test_shortoption_valid_valid_shortoption_multiple "arg barg" "-a" "arg" "-b" "barg"
}