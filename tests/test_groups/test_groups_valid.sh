#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_groups_valid_name_with_number {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags2" "XOR" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_valid_optional_mutex_blank {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "XOR" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_valid_optional_mutin_blank {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "AND" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_valid_optional_mutor_blank {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "OR" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_valid_optional_two_mutex {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "XOR" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_valid_optional_two_mutin {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "AND" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_valid_optional_two_mutor {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "OR" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_valid_optional_three_mutex {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "XOR" "optional" "--flag" "--glad" "--vlad"
	koi::parseargs "$@"

	echo "$flag $glad $vlad"
}

function test_groups_valid_optional_three_mutin {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "AND" "optional" "--flag" "--glad" "--vlad"
	koi::parseargs "$@"

	echo "$flag $glad $vlad"
}

function test_groups_valid_optional_three_mutor {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "OR" "optional" "--flag" "--glad" "--vlad"
	koi::parseargs "$@"

	echo "$flag $glad $vlad"
}

function test_groups_valid_required_two_mutex {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "XOR" "required" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_valid_required_two_mutin {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "AND" "required" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_valid_required_two_mutor {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "OR" "required" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_valid_required_three_mutex {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "XOR" "required" "--flag" "--glad" "--vlad"
	koi::parseargs "$@"

	echo "$flag $glad $vlad"
}

function test_groups_valid_required_three_mutin {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "AND" "required" "--flag" "--glad" "--vlad"
	koi::parseargs "$@"

	echo "$flag $glad $vlad"
}

function test_groups_valid_required_three_mutor {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "OR" "required" "--flag" "--glad" "--vlad"
	koi::parseargs "$@"

	echo "$flag $glad $vlad"
}

function test_groups_valid_optional_mixed_blank {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storevalue" "optional" "" "help text"
	koi::addgroup "group" "XOR" "optional" "--flag" "--arg"
	koi::parseargs "$@"

	echo "$flag $arg"
}

function test_groups_valid_optional_mixed_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storevalue" "optional" "" "help text"
	koi::addgroup "group" "XOR" "optional" "--flag" "--arg"
	koi::parseargs "$@"

	echo "$flag $arg"
}

function test_groups_valid_optional_mixed_b {
	koi::addarg "-a" "--arg" "storevalue" "optional" "" "help text"
	koi::addarg "-b" "--barg" "storevalue" "optional" "" "help text"
	koi::addgroup "group" "AND" "optional" "--arg" "--barg"
	koi::parseargs "$@"

	echo "$arg $barg"
}

function test_groups_valid_required_mixed_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storevalue" "optional" "" "help text"
	koi::addgroup "group" "XOR" "required" "--flag" "--arg"
	koi::parseargs "$@"

	echo "$flag $arg"
}

function test_groups_valid_required_mixed_b {
	koi::addarg "-a" "--arg" "storevalue" "optional" "" "help text"
	koi::addarg "-b" "--barg" "storevalue" "optional" "" "help text"
	koi::addgroup "group" "AND" "required" "--arg" "--barg"
	koi::parseargs "$@"

	echo "$arg $barg"
}

function test_group_valid_no_short_option {
	koi::addarg "" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "AND" "required" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_group_valid_with_array_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arr" "storearray" "optional" "" "help text"
	koi::addgroup "group" "XOR" "required" "--flag" "--arr"
	koi::parseargs "$@"

	echo "${arr[@]} $flag"
}

function test_group_valid_with_array_b {
	koi::addarg "-a" "--arr" "storearray" "optional" "" "help text"
	koi::addarg "-b" "--bar" "storearray" "optional" "" "help text"
	koi::addgroup "arrays" "XOR" "required" "--arr" "--bar"
	koi::parseargs "$@"

	echo "${arr[@]} ${bar[@]}" 
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_groups_valid_name_with_number "0 1" "-g"
	runtest test_groups_valid_optional_mutex_blank "0 0"
	runtest test_groups_valid_optional_mutin_blank "0 0"
	runtest test_groups_valid_optional_mutor_blank "0 0"
	runtest test_groups_valid_optional_two_mutex "1 0" "-f"
	runtest test_groups_valid_optional_two_mutin "1 1" "-f" "-g"
	runtest test_groups_valid_optional_two_mutor "0 1" "-g"
	runtest test_groups_valid_optional_three_mutex "0 1 0" "-g"
	runtest test_groups_valid_optional_three_mutin "1 1 1" "-g" "-f" "-v"
	runtest test_groups_valid_optional_three_mutor "0 0 1" "-v"
	runtest test_groups_valid_required_two_mutex "1 0" "-f"
	runtest test_groups_valid_required_two_mutin "1 1" "-f" "-g"
	runtest test_groups_valid_required_two_mutor "0 1" "-g"
	runtest test_groups_valid_required_three_mutex "0 1 0" "-g"
	runtest test_groups_valid_required_three_mutin "1 1 1" "-g" "-f" "-v"
	runtest test_groups_valid_required_three_mutor "0 0 1" "-v"
	runtest test_groups_valid_optional_mixed_blank "0 "
	runtest test_groups_valid_optional_mixed_a "0 value" "--arg" "value"
	runtest test_groups_valid_optional_mixed_b "avalue bvalue" "-b" "bvalue" "--arg" "avalue"
	runtest test_groups_valid_required_mixed_a "0 value" "--arg" "value"
	runtest test_groups_valid_required_mixed_b "avalue bvalue" "-b" "bvalue" "--arg" "avalue"
	runtest test_group_valid_no_short_option "1 1" "-g" "--flag"
	runtest test_group_valid_with_array_a "abc def 0" "-a" "abc" "-a" "def"
	runtest test_group_valid_with_array_b "a0 a1 b0 b1" "-a" "a0" "-a" "a1" "-b" "b0" "-b" "b1"
}