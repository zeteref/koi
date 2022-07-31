#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_dependencies_valid_one_dependent_flag {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "--glad"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_valid_two_dependents_flags {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "--glad" "dependson" "--vlad"
	koi::parseargs "$@"
	echo "$flag $glad $vlad"
}

function test_dependencies_valid_three_dependents_flags {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addarg "-c" "--clad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "--glad" "--vlad" "dependson" "--clad"
	koi::parseargs "$@"
	echo "$flag $glad $vlad $clad"
}

function test_dependencies_valid_mixed_types_valid {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storevalue" "optional" "" "help text"
	koi::addarg "-b" "--barg" "storevalue" "optional" "" "help text"
	koi::adddep "--arg" "--flag" "dependson" "--barg"
	koi::parseargs "$@"
	echo "$flag $arg $barg"
}

function test_dependencies_valid_mixed_types_invalid {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storevalue" "optional" "" "help text"
	koi::addarg "-b" "--barg" "storevalue" "optional" "" "help text"
	koi::adddep "--arg" "--flag" "dependson" "--barg"
	koi::parseargs "$@"
	echo "$flag $arg $barg"
}

function test_dependencies_valid_storearray_valid_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storearray" "optional" "" "help text"
	koi::adddep "--arg" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag ${arg[@]}"
}

function test_dependencies_valid_storearray_valid_b {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storearray" "optional" "" "help text"
	koi::adddep "--arg" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag ${arg[@]}"
}

function test_dependencies_valid_storearray_valid_c {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storearray" "optional" "" "help text"
	koi::addarg "-b" "--barg" "storearray" "optional" "" "help text"
	koi::adddep "--arg" "--barg" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag ${arg[@]} ${barg[@]}"
}

function test_dependencies_valid_storearray_valid_d {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storearray" "optional" "" "help text"
	koi::addarg "-b" "--barg" "storearray" "optional" "" "help text"
	koi::adddep "--arg" "--barg" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag ${arg[@]} ${barg[@]}"
}

function test_dependencies_valid_storearray_invalid_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storearray" "optional" "" "help text"
	koi::adddep "--arg" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag ${arg[@]}"
}

function test_dependencies_valid_storearray_invalid_b {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storearray" "optional" "" "help text"
	koi::adddep "--arg" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag ${arg[@]}"
}

function test_dependencies_valid_storearray_invalid_c {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storearray" "optional" "" "help text"
	koi::addarg "-b" "--barg" "storearray" "optional" "" "help text"
	koi::adddep "--arg" "--barg" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag ${arg[@]} ${barg[@]}"
}

function test_dependencies_valid_storearray_invalid_d {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-a" "--arg" "storearray" "optional" "" "help text"
	koi::addarg "-b" "--barg" "storearray" "optional" "" "help text"
	koi::adddep "--arg" "--barg" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag ${arg[@]} ${barg[@]}"
}

function test_dependencies_valid_argument_named_dependson {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "" "--dependson" "flag" "optional" "" "help text"
	koi::adddep "--dependson" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $dependson"
}

function test_dependencies_valid_missing_dependency {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::adddep "--glad" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_valid_missing_dependent {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::adddep "--glad" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_valid_joint_arguments_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::adddep "--glad" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_valid_joint_arguments_b {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::adddep "--glad" "--vlad" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $glad $vlad"
}

function test_dependencies_valid_mutin_group {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "AND" "optional" "--flag" "--glad"
	koi::adddep "--glad" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_valid_mutor_group {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "OR" "optional" "--flag" "--glad"
	koi::adddep "--glad" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_valid_group_misc {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addarg "-c" "--clad" "flag" "optional" "" "help text"
	koi::addgroup "flags1" "XOR" "optional" "--flag" "--glad"
	koi::addgroup "flags2" "XOR" "optional" "--glad" "--vlad"
	koi::adddep "--flag" "--glad" "dependson" "--clad"
	koi::adddep "--vlad" "dependson" "--clad"
	koi::parseargs "$@"
	echo "$flag $glad $vlad $clad"
}

function test_dependencies_valid_dependents_in_mutex {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "XOR" "optional" "--flag" "--glad"
	koi::adddep "--flag" "--glad" "dependson" "--vlad"
	koi::parseargs "$@"
	echo "$flag $glad $vlad"
}

function test_dependencies_valid_multiple_dependents_single_dependency {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "--glad" "dependson" "--vlad"
	koi::parseargs "$@"
	echo "$flag $glad $vlad"
}

function test_dependencies_valid_single_dependent_multiple_dependencies_valid {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "--vlad"
	koi::adddep "--flag" "dependson" "--glad"
	koi::parseargs "$@"
	echo "$flag $glad $vlad"
}

function test_dependencies_valid_single_dependent_multiple_dependencies_invalid {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "--vlad"
	koi::adddep "--flag" "dependson" "--glad"
	koi::parseargs "$@"
	echo "$flag $glad $vlad"
}

function test_dependencies_valid_multiple_dependency_groups_valid {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addarg "-c" "--clad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "--glad"
	koi::adddep "--glad" "dependson" "--vlad"
	koi::adddep "--flag" "dependson" "--clad"
	koi::parseargs "$@"
	echo "$flag $glad $vlad $clad"
}

function test_dependencies_valid_multiple_dependency_groups_invalid_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addarg "-c" "--clad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "--glad"
	koi::adddep "--glad" "dependson" "--vlad"
	koi::adddep "--flag" "dependson" "--clad"
	koi::parseargs "$@"
	echo "$flag $glad $vlad $clad"
}

function test_dependencies_valid_multiple_dependency_groups_invalid_b {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::addarg "-c" "--clad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "--glad"
	koi::adddep "--glad" "dependson" "--vlad"
	koi::adddep "--flag" "dependson" "--clad"
	koi::parseargs "$@"
	echo "$flag $glad $vlad $clad"
}

function test_dependencies_valid_required_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::adddep "--glad" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_valid_required_b {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "required" "" "help text"
	koi::adddep "--flag" "dependson" "--glad"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_valid_required_c {
	koi::addarg "-f" "--flag" "flag" "required" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::adddep "--glad" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_valid_required_d {
	koi::addarg "-f" "--flag" "flag" "required" "" "help text"
	koi::addarg "-g" "--glad" "flag" "required" "" "help text"
	koi::adddep "--glad" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $glad"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_dependencies_valid_one_dependent_flag "0 1" "-g"
	runtest test_dependencies_valid_two_dependents_flags "1 0 1" "-f" "-v"
	runtest test_dependencies_valid_three_dependents_flags "0 1 1 1" "-g" "-c" "-v"
	runtest test_dependencies_valid_mixed_types_valid "1  barg" "-f" "-b" "barg"
	runtest test_dependencies_valid_mixed_types_invalid __error__ "-a" "arg"
	runtest test_dependencies_valid_storearray_valid_a "1 arg" "-a" "arg" "-f"
	runtest test_dependencies_valid_storearray_valid_b "1 arg barg" "-a" "arg" "-f" "-a" "barg"
	runtest test_dependencies_valid_storearray_valid_c "1 arg barg" "-a" "arg" "-f" "-b" "barg"
	runtest test_dependencies_valid_storearray_valid_d "1 arg aarg barg bbarg" "-a" "arg" "-b" "barg" "-a" "aarg" "-f" "-b" "bbarg"
	runtest test_dependencies_valid_storearray_invalid_a __error__ "-a" "arg"
	runtest test_dependencies_valid_storearray_invalid_b __error__ "-a" "arg" "-a" "barg"
	runtest test_dependencies_valid_storearray_invalid_c __error__ "-b" "barg"
	runtest test_dependencies_valid_storearray_invalid_d __error__ "-a" "arg" "-b" "barg" "-a" "aarg" "-b" "bbarg"
	runtest test_dependencies_valid_argument_named_dependson "1 1" "-f" "--dependson"
	runtest test_dependencies_valid_missing_dependency __error__ "--glad"
	runtest test_dependencies_valid_missing_dependent "1 0" "--flag"
	runtest test_dependencies_valid_joint_arguments_a "1 1" "-fg"
	runtest test_dependencies_valid_joint_arguments_b "1 1 1" "-fvg"
	runtest test_dependencies_valid_mutin_group "1 1" "-f" "-g"
	runtest test_dependencies_valid_mutor_group "1 1" "-f" "-g"
	runtest test_dependencies_valid_group_misc "1 0 1 1" "-f" "-v" "-c"
	runtest test_dependencies_valid_dependents_in_mutex "0 1 1" "-v" "-g"
	runtest test_dependencies_valid_multiple_dependents_single_dependency "1 1 1" "-v" "-g" "-f"
	runtest test_dependencies_valid_single_dependent_multiple_dependencies_valid "1 1 1" "-f" "-v" "-g"
	runtest test_dependencies_valid_single_dependent_multiple_dependencies_invalid __error__ "-f" "-v"
	runtest test_dependencies_valid_multiple_dependency_groups_valid "0 1 1 0" "-g" "-v"
	runtest test_dependencies_valid_multiple_dependency_groups_invalid_a __error__ "-f" "-c" "-v"
	runtest test_dependencies_valid_multiple_dependency_groups_invalid_b __error__ "-g" "-c"
	runtest test_dependencies_valid_required_a "0 0"
	runtest test_dependencies_valid_required_b "0 1" "-g"
	runtest test_dependencies_valid_required_c "1 0" "-f"
	runtest test_dependencies_valid_required_d "1 1" "-g" "-f"
}