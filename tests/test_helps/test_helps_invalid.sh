#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_help_invalid_blank {
	koi::addarg "-h" "--help" "help" "optional" "" ""
	koi::parseargs "$@"
	echo "$help"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_help_invalid_blank __error__ "-h"
}