#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_action_positionalarray_valid_required {
	koi::addarg "" "aaa" "positionalarray" "required" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]}"
}

function test_action_positionalarray_valid_optional {
	koi::addarg "" "aaa" "positionalarray" "optional" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]}"
}

function test_action_positionalarray_valid_required_multiple_arguments {
	koi::addarg "" "aaa" "positionalarray" "required" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]}"
}

function test_action_positionalarray_valid_optional_multiple_arguments {
	koi::addarg "" "aaa" "positionalarray" "optional" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]}"
}

function test_action_positionalarray_valid_with_dash {
	koi::addarg "" "aaa" "positionalarray" "required" "" "help text"
	koi::parseargs "$@"
	echo "${aaa[@]}"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_action_positionalarray_valid_required "arg" "arg"
	runtest test_action_positionalarray_valid_optional "arg" "arg"
	runtest test_action_positionalarray_valid_optional "" ""
	runtest test_action_positionalarray_valid_required_multiple_arguments "arg barg" "arg" "barg"
	runtest test_action_positionalarray_valid_optional_multiple_arguments "arg barg" "arg" "barg"
	runtest test_action_positionalarray_valid_optional_multiple_arguments "" ""
	runtest test_action_positionalarray_valid_with_dash "-f" "-f"
	runtest test_action_positionalarray_valid_with_dash "-f -g" "-f -g"
}