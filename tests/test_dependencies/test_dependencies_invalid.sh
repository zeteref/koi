#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_dependencies_invalid_too_few_arguments {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "--glad"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_invalid_mutex_group_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "XOR" "optional" "--flag" "--glad"
	koi::adddep "--flag" "dependson" "--glad"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_invalid_mutex_group_b {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "--glad"
	koi::addgroup "flags" "XOR" "optional" "--flag" "--glad"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_invalid_dependent_not_registered {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::adddep "--glad" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag"
}

function test_dependencies_invalid_dependency_not_registered {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "--glad"
	koi::parseargs "$@"
	echo "$flag"
}

function test_dependencies_invalid_no_property {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addarg "-v" "--vlad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "--glad" "--vlad"
	koi::parseargs "$@"
	echo "$flag $glad $vlad"
}

function test_dependencies_invalid_depend_on_itself {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag"
}

function test_dependencies_invalid_positionalvalue_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "" "arg" "positionalvalue" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "arg"
	koi::parseargs "$@"
	echo "$flag $arg"
}

function test_dependencies_invalid_positionalvalue_b {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "" "arg" "positionalvalue" "optional" "" "help text"
	koi::adddep "arg" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $arg"
}

function test_dependencies_invalid_positionalarray_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "" "arg" "positionalarray" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "arg"
	koi::parseargs "$@"
	echo "$flag $arg"
}

function test_dependencies_invalid_positionalarray_b {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "" "arg" "positionalarray" "optional" "" "help text"
	koi::adddep "arg" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $arg"
}

function test_dependencies_invalid_help_a {
	koi::addarg "-h" "--help" "help" "optional" "" "help text"
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "--help"
	koi::parseargs "$@"
	echo "$flag $help"
}

function test_dependencies_invalid_help_b {
	koi::addarg "-h" "--help" "help" "optional" "" "help text"
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::adddep "--help" "dependson" "--flag"
	koi::parseargs "$@"
	echo "$flag $help"
}

function test_dependencies_invalid_duplicate_adddep_entries_simple {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "--glad"
	koi::adddep "--flag" "dependson" "--glad"
	koi::parseargs "$@"
	echo "$flag $glad"
}

function test_dependencies_invalid_duplicate_adddep_entries_complex {
	koi::addarg "-a" "--arg" "storevalue" "optional" "" "help text"
	koi::addarg "-b" "--barg" "storevalue" "optional" "" "help text"
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::addgroup "flags" "XOR" "optional" "--flag" "--glad"
	koi::adddep "--flag" "--glad" "dependson" "--arg"
	koi::adddep "--flag" "dependson" "--arg"
	koi::adddep "--flag" "dependson" "--barg"
	koi::adddep "--glad" "dependson" "--barg"
	koi::parseargs "$@"
	echo "$arg $barg $flag $glad"
}

function test_dependencies_invalid_use_shortoption_a {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::adddep "-f" "dependson" "--glad"
	echo "$flag $glad"
}

function test_dependencies_invalid_use_shortoption_b {
	koi::addarg "-f" "--flag" "flag" "optional" "" "help text"
	koi::addarg "-g" "--glad" "flag" "optional" "" "help text"
	koi::adddep "--flag" "dependson" "-g"
	echo "$flag $glad"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_dependencies_invalid_too_few_arguments __error__ "-f"
	runtest test_dependencies_invalid_mutex_group_a __error__ "-f"
	runtest test_dependencies_invalid_mutex_group_b __error__ "-g"
	runtest test_dependencies_invalid_dependent_not_registered __error__ "-f"
	runtest test_dependencies_invalid_dependency_not_registered __error__ "-f"
	runtest test_dependencies_invalid_no_property __error__ "-f"
	runtest test_dependencies_invalid_depend_on_itself __error__ "-f"
	runtest test_dependencies_invalid_positionalvalue_a __error__ "-f"
	runtest test_dependencies_invalid_positionalvalue_b __error__ "f"
	runtest test_dependencies_invalid_positionalarray_a __error__ "-f"
	runtest test_dependencies_invalid_positionalarray_b __error__ "f"
	runtest test_dependencies_invalid_help_a __error__ "-h"
	runtest test_dependencies_invalid_help_b __error__ "-f"
	runtest test_dependencies_invalid_duplicate_adddep_entries_simple __error__ "-g"
	runtest test_dependencies_invalid_duplicate_adddep_entries_complex __error__ "-g"
	runtest test_dependencies_invalid_use_shortoption_a __error__ "-g"
	runtest test_dependencies_invalid_use_shortoption_b __error__ "-g" "-b" "barg" "-a" "arg"
}