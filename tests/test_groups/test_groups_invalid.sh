#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_groups_invalid_too_few_arguments {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "XOR" "optional"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_invalid_name_blank {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "" "XOR" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_invalid_name_non_alphanumeric {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "--group" "XOR" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_invalid_name_starts_with_number {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "99group" "XOR" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_invalid_name_non_registered_argument {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "group" "XOR" "optional" "--flag" "--glad" "--vlad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_invalid_property {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "group" "and" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_invalid_required {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "group" "AND" "notrequired" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad"
}

function test_groups_invalid_action_help {
	koi::addarg "-h" "--help" "help" "optional" "" "help text"
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "group" "XOR" "optional" "--help" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$help $flag $glad"
}

function test_groups_invalid_action_positionalvalue {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "" "pos" "positionalvalue" "optional" "" "help text"
	koi::addgroup "group" "XOR" "optional" "--flag" "--glad" "pos"
	koi::parseargs "$@"

	echo "$flag $glad $pos"
}

function test_groups_invalid_action_positionalarray {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "" "pos" "positionalarray" "optional" "" "help text"
	koi::addgroup "group" "XOR" "optional" "--flag" "--glad" "pos"
	koi::parseargs "$@"

	echo "$flag $glad ${pos[@]}"
}

function test_groups_invalid_argument_required {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "required" "" "help text"
	koi::addgroup "group" "XOR" "optional" "--flag" "--glad"
	koi::parseargs "$@"

	echo "$flag $glad $pos"
}

function test_groups_invalid_shortoptions_only {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "group" "XOR" "optional" "-f" "-g"
	koi::parseargs "$@"

	echo "$flag $glad $pos"
}

function test_groups_invalid_duplicate_arguments {
	koi::addarg "-a" "--aaa" "flag" "optional" "" "help text"
	koi::addgroup "wrong" "XOR" "optional" "--aaa" "--aaa"
	koi::parseargs "$@"

	echo "$aaa"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_groups_invalid_too_few_arguments __error__ "--flag"
	runtest test_groups_invalid_name_blank __error__ "-f"
	runtest test_groups_invalid_name_non_alphanumeric __error__ "-g"
	runtest test_groups_invalid_name_starts_with_number __error__ "--glad"
	runtest test_groups_invalid_name_non_registered_argument __error__ "--flag"
	runtest test_groups_invalid_property __error__ "-g" "-f"
	runtest test_groups_invalid_required __error__ "-f" "-g"
	runtest test_groups_invalid_action_help __error__ "-g"
	runtest test_groups_invalid_action_positionalvalue __error__ "-g" "arg"
	runtest test_groups_invalid_action_positionalarray __error__ "-f" "arg" "arg"
	runtest test_groups_invalid_argument_required __error__ "--glad"
	runtest test_groups_invalid_shortoptions_only __error__ "-f" "-g"
	runtest test_groups_invalid_duplicate_arguments __error__ "-aaa"
}