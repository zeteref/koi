#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_action_positionalarray_invalid_with_shortname {
	koi::addarg "-a" "aaa" "positionalarray" "optional" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]}"
}

function test_action_positionalarray_invalid_with_dash {
	koi::addarg "" "-aaa" "positionalarray" "optional" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]}"
}

function test_action_positionalarray_invalid_with_dash_multiple {
	koi::addarg "" "--aaa" "positionalarray" "optional" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]}"
}

function test_action_positionalarray_invalid_with_default {
	koi::addarg "" "aaa" "positionalarray" "optional" "val" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]}"
}

function test_action_positionalarray_invalid_multiple_a {
	koi::addarg "" "aaa" "positionalarray" "required" "" "help text"
	koi::addarg "" "bbb" "positionalarray" "required" "" "help text"
	echo "${aaa[@]} ${bbb[@]}"
}

function test_action_positionalarray_invalid_multiple_b {
	koi::addarg "" "aaa" "positionalarray" "optional" "" "help text"
	koi::addarg "" "bbb" "positionalarray" "optional" "" "help text"
	echo "${aaa[@]} ${bbb[@]}"
}

function test_action_positionalarray_invalid_multiple_c {
	koi::addarg "" "aaa" "positionalarray" "required" "" "help text"
	koi::addarg "" "bbb" "positionalarray" "optional" "" "help text"
	echo "${aaa[@]} ${bbb[@]}"
}

function test_action_positionalarray_invalid_with_positionalvalue_a {
	koi::addarg "" "aaa" "positionalarray" "required" "" "help text"
	koi::addarg "" "bbb" "positionalvalue" "required" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]} $bbb"
}

function test_action_positionalarray_invalid_with_positionalvalue_b {
	koi::addarg "" "aaa" "positionalarray" "required" "" "help text"
	koi::addarg "" "bbb" "positionalvalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]} $bbb"
}

function test_action_positionalarray_invalid_with_positionalvalue_c {
	koi::addarg "" "aaa" "positionalarray" "optional" "" "help text"
	koi::addarg "" "bbb" "positionalvalue" "required" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]} $bbb"
}

function test_action_positionalarray_invalid_with_positionalvalue_d {
	koi::addarg "" "aaa" "positionalarray" "optional" "" "help text"
	koi::addarg "" "bbb" "positionalvalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]} $bbb"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_action_positionalarray_invalid_with_shortname __error__ "arg"
	runtest test_action_positionalarray_invalid_with_dash __error__ "arg"
	runtest test_action_positionalarray_invalid_with_dash_multiple __error__ "arg"
	runtest test_action_positionalarray_invalid_with_default __error__ "arg"
	runtest test_action_positionalarray_invalid_multiple_a __error__ "arg" "barg"
	runtest test_action_positionalarray_invalid_multiple_b __error__ "arg" "barg"
	runtest test_action_positionalarray_invalid_multiple_c __error__ "arg" "barg"
	runtest test_action_positionalarray_invalid_with_positionalvalue_a __error__ "arg" "barg"
	runtest test_action_positionalarray_invalid_with_positionalvalue_b __error__ "arg" "barg"
	runtest test_action_positionalarray_invalid_with_positionalvalue_c __error__ "arg" "barg"
	runtest test_action_positionalarray_invalid_with_positionalvalue_d __error__ "arg" "barg"
}