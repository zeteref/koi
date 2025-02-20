#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_action_help_valid {
	koi::addarg "-h" "--help" "help" "optional" "" "help text"
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text"
	koi::addarg "-b" "--bbb" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	local helptext=$(cat <<- EOF
	\033[93mkoi test_action_help_valid [-h] [-a AAA] [-b BBB] \033[0m
	help text
	  -a, --aaa AAA    help text (optional) 
	  -b, --bbb BBB    help text (optional) 
	EOF
	)
	# TODO: fix this test (why does it fail?)
	# runtest test_action_help_valid "$helptext" "-h"
}