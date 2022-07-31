#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_action_positionalvalue_invalid_with_shortname {
	koi::addarg "-a" "aaa" "positionalvalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_action_positionalvalue_invalid_with_dash {
	koi::addarg "" "-aaa" "positionalvalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_action_positionalvalue_invalid_with_dash_multiple {
	koi::addarg "" "--aaa" "positionalvalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_action_positionalvalue_invalid_with_default {
	koi::addarg "" "aaa" "positionalvalue" "optional" "val" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_action_positionalvalue_invalid_required_and_optional {
	koi::addarg "" "aaa" "positionalvalue" "optional" "" "help text"
	koi::addarg "" "bbb" "positionalvalue" "required" "" "help text"
	koi::parseargs "$@"
	echo "$aaa $bbb"
}

function test_action_positionalvalue_invalid_multiple_optional {
	koi::addarg "" "aaa" "positionalvalue" "optional" "" "help text"
	koi::addarg "" "bbb" "positionalvalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa $bbb"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_action_positionalvalue_invalid_with_shortname __error__ "arg"
	runtest test_action_positionalvalue_invalid_with_dash __error__ "arg"
	runtest test_action_positionalvalue_invalid_with_dash_multiple __error__ "arg"
	runtest test_action_positionalvalue_invalid_with_default __error__ "arg"
	runtest test_action_positionalvalue_invalid_required_and_optional __error__ "arg" "barg"
	runtest test_action_positionalvalue_invalid_multiple_optional __error__ "arg" "barg"
}