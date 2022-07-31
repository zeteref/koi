#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_action_help_invalid_shortoption {
	koi::addarg "-g" "--help" "help" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$help"
}

function test_action_help_invalid_longoption {
	koi::addarg "-h" "--gelp" "help" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$gelp"
}

function test_action_help_invalid_with_default {
	koi::addarg "-h" "--help" "help" "optional" "help" "help text"
	koi::parseargs "$@"
	echo "$help"
}

function test_action_help_invalid_missing {
	koi::addarg "-h" "--help" "help" "optional" ""
	koi::parseargs "$@"
	echo "$help"
}

function test_action_help_invalid_blank {
	koi::addarg "-h" "--help" "help" "optional" "" ""
	koi::parseargs "$@"
	echo "$help"
}

function test_action_help_invalid_required {
	koi::addarg "-h" "--help" "help" "required" "" "help text"
	koi::parseargs "$@"
	echo "$help"
}

function test_action_help_invalid_verifyingfunction {
	koi::addarg "-h" "--help" "help" "optional" "" "help text" "__verifyhelp"
	koi::parseargs "$@"
	echo "$help"
}

function test_action_help_invalid_multiple_same_letter {
	koi::addarg "-h" "--help" "help" "optional" "" "help text"
	koi::addarg "-h" "--help" "help" "optional" "" "help text 2"
	koi::parseargs "$@"
	echo "$help"
}

function test_action_help_invalid_multiple_different_letter {
	koi::addarg "-h" "--help" "help" "optional" "" "help text"
	koi::addarg "-g" "--gelp" "help" "optional" "" "help text 2"
	koi::parseargs "$@"
	echo "$help $gelp"
}

function __verifyhelp {
	:
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_action_help_invalid_shortoption __error__ "-g"
	runtest test_action_help_invalid_longoption __error__ "--gelp"
	runtest test_action_help_invalid_with_default __error__ "-h"
	runtest test_action_help_invalid_missing __error__ "-h"
	runtest test_action_help_invalid_blank __error__ "-h"
	runtest test_action_help_invalid_required __error__ "-h"
	runtest test_action_help_invalid_verifyingfunction __error__ "-h"
	runtest test_action_help_invalid_multiple_same_letter __error__ "-h"
	runtest test_action_help_invalid_multiple_different_letter __error__ "-h" "-g"
}