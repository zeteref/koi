#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_action_invalid {
	koi::addarg "-a" "--aaa" "mycoolaction" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_action_invalid __error__ "--aaa" "arg"
}