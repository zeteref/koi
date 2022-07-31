#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_action_valid_storeavlue_optional_with_value {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_action_valid_storeavlue_optional_without_value {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_action_valid_storevalue_required {
	koi::addarg "-a" "--aaa" "storevalue" "required" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_action_valid_storevalue_with_default {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "foo" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_action_valid_storevalue_multiple_a {
	koi::addarg "-a" "--aaa" "storevalue" "required" "" "help text"
	koi::addarg "-b" "--bbb" "storevalue" "required" "" "help text"
	koi::parseargs "$@"
	echo "$aaa $bbb"
}

function test_action_valid_storevalue_multiple_b {
	koi::addarg "-a" "--aaa" "storevalue" "required" "" "help text"
	koi::addarg "-b" "--bbb" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa $bbb"
}

function test_action_valid_storevalue_multiple_c {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text"
	koi::addarg "-b" "--bbb" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa $bbb"
}

function test_action_valid_storevalue_overwrite_required {
	koi::addarg "-a" "--aaa" "storevalue" "required" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_action_valid_storevalue_overwrite_optional {
	koi::addarg "-a" "--aaa" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_action_valid_storeavlue_optional_with_value "arg" "-a" "arg"
	runtest test_action_valid_storeavlue_optional_without_value ""
	runtest test_action_valid_storevalue_required "arg" "-a" "arg"
	runtest test_action_valid_storevalue_required __error__ ""
	runtest test_action_valid_storevalue_with_default "arg" "-a" "arg"
	runtest test_action_valid_storevalue_with_default "foo"
	runtest test_action_valid_storevalue_multiple_a "arg barg" "-a" "arg" "-b" "barg"
	runtest test_action_valid_storevalue_multiple_b "arg barg" "-a" "arg" "-b" "barg"
	runtest test_action_valid_storevalue_multiple_c "arg barg" "-a" "arg" "-b" "barg"
	runtest test_action_valid_storevalue_multiple_c " "
	runtest test_action_valid_storevalue_overwrite_required "barg" "-a" "arg" "-a" "barg"
	runtest test_action_valid_storevalue_overwrite_optional "barg" "-a" "arg" "-a" "barg"
}