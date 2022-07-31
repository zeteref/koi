#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_general_invalid_addarg_arguments_less {
	koi::addarg "-h" "--help" "help"
	koi::parseargs "$@"
	echo "$help"
}

function test_general_invalid_addarg_arguments_more {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text" "" "abcd" "asdf"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_general_invalid_duplicate_names {
	koi::addarg "-n" "--name" "storevalue" "optional" "" "help text"
	koi::addarg "" "name" "positionalvalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$name"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_general_invalid_addarg_arguments_less __error__ "-h"
	runtest test_general_invalid_addarg_arguments_more __error__ "--aaa" "arg"
	runtest test_general_invalid_duplicate_names __error__ "-n" "will"
}