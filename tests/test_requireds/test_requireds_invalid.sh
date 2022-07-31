#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_required_invalid_not_optional_or_required {
	koi::addarg "-a" "--aaa" "storevalue" "Required" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_required_invalid_help {
	koi::addarg "-h" "--help" "help" "required" "" "help text"
	koi::parseargs "$@"
	echo "$help"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_required_invalid_not_optional_or_required __error__ "-a" "arg"
	runtest test_required_invalid_help __error__ "-h"
}