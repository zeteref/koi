#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_action_flag_invalid_with_default {
	koi::addarg "-f" "--flag" "flag" "optional" "1" "help text"
	koi::parseargs "$@"
	echo "$flag"
}

function test_action_flag_invalid_with_verifyingfunction {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text" "__verifyflag"
	koi::parseargs "$@"
	echo "$flag"
}

function __verifyflag {
	:
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_action_flag_invalid_with_default __error__ "-f"
	runtest test_action_flag_invalid_with_verifyingfunction __error__ "-f"
}