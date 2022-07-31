#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_default_valid_storevalue {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "foo" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_default_valid_storevalue "arg" "-a" "arg"
	runtest test_default_valid_storevalue "foo"
}