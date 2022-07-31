#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_action_positionalvalue_valid_required_singular {
	koi::addarg "" "aaa" "positionalvalue" "required" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_action_positionalvalue_valid_required_multiple {
	koi::addarg "" "aaa" "positionalvalue" "required" "" "help text"
	koi::addarg "" "bbb" "positionalvalue" "required" "" "help text"
	koi::addarg "" "ccc" "positionalvalue" "required" "" "help text"
	koi::parseargs "$@"
	echo "$bbb $ccc $aaa"
}

function test_action_positionalvalue_valid_optional {
	koi::addarg "" "aaa" "positionalvalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_action_positionalvalue_valid_with_dash {
	koi::addarg "" "aaa" "positionalvalue" "required" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_action_positionalvalue_valid_required_singular "arg" "arg"
	runtest test_action_positionalvalue_valid_required_multiple "barg carg arg" "arg" "barg" "carg"
	runtest test_action_positionalvalue_valid_optional "arg" "arg"
	runtest test_action_positionalvalue_valid_optional "" ""
	runtest test_action_positionalvalue_valid_with_dash "-f" "-f"
}