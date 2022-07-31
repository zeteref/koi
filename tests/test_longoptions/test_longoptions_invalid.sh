#!/bin/bash

koirequirehelpactions=0

# ========= TESTS ========= #
function test_longoption_invalid_missing {
	koi::addarg "-a" "" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$a"
}

function test_longoption_invalid_starts_with_number {
	koi::addarg "-a" "--9a" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$9a"
}

function test_longoption_invalid_single_dash {
	koi::addarg "-a" "-aaa" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_longoption_invalid_non_alphanumeric {
	koi::addarg "-a" "--aa-a" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_longoption_invalid_non_unique {
	koi::addarg "-a" "--aaa" "optional" "" "help text"
	koi::addarg "-b" "--aaa" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_longoption_invalid_positionalvalue {
	koi::addarg "" "--aaa" "positionalvalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_longoption_invalid_positionalarray {
	koi::addarg "" "--aaa" "positionalarray" "optional" "" "help text"
	koi::parseargs "$@"
	echo "$aaa"
}

function test_longoption_invalid_illegal_names {
	koi::addarg "" "--BASH" "storevalue" "optional" "" "help text"
	koi::addarg "" "--BASH_ENV" "storevalue" "optional" "" "help text"
	koi::addarg "" "--BASH_SUBSHELL" "storevalue" "optional" "" "help text"
	koi::addarg "" "--BASHPID" "storevalue" "optional" "" "help text"
	koi::addarg "" "--BASH_VERSINFO" "storevalue" "optional" "" "help text"
	koi::addarg "" "--BASH_VERSION" "storevalue" "optional" "" "help text"
	koi::addarg "" "--CDPATH" "storevalue" "optional" "" "help text"
	koi::addarg "" "--DIRSTACK" "storevalue" "optional" "" "help text"
	koi::addarg "" "--EDITOR" "storevalue" "optional" "" "help text"
	koi::addarg "" "--EUID" "storevalue" "optional" "" "help text"
	koi::addarg "" "--FUNCNAME" "storevalue" "optional" "" "help text"
	koi::addarg "" "--GLOBIGNORE" "storevalue" "optional" "" "help text"
	koi::addarg "" "--GROUPS" "storevalue" "optional" "" "help text"
	koi::addarg "" "--HOME" "storevalue" "optional" "" "help text"
	koi::addarg "" "--HOSTNAME" "storevalue" "optional" "" "help text"
	koi::addarg "" "--HOSTTYPE" "storevalue" "optional" "" "help text"
	koi::addarg "" "--IFS" "storevalue" "optional" "" "help text"
	koi::addarg "" "--IGNOREEOF" "storevalue" "optional" "" "help text"
	koi::addarg "" "--LC_COLLATE" "storevalue" "optional" "" "help text"
	koi::addarg "" "--LC_CTYPE" "storevalue" "optional" "" "help text"
	koi::addarg "" "--LINENO" "storevalue" "optional" "" "help text"
	koi::addarg "" "--MACHTYPE" "storevalue" "optional" "" "help text"
	koi::addarg "" "--OLDPWD" "storevalue" "optional" "" "help text"
	koi::addarg "" "--OSTYPE" "storevalue" "optional" "" "help text"
	koi::addarg "" "--PATH" "storevalue" "optional" "" "help text"
	koi::addarg "" "--PIPESTATUS" "storevalue" "optional" "" "help text"
	koi::addarg "" "--PPID" "storevalue" "optional" "" "help text"
	koi::addarg "" "--PROMPT_COMMAND" "storevalue" "optional" "" "help text"
	koi::addarg "" "--PS1" "storevalue" "optional" "" "help text"
	koi::addarg "" "--PS2" "storevalue" "optional" "" "help text"
	koi::addarg "" "--PS3" "storevalue" "optional" "" "help text"
	koi::addarg "" "--PS4" "storevalue" "optional" "" "help text"
	koi::addarg "" "--PWD" "storevalue" "optional" "" "help text"
	koi::addarg "" "--REPLY" "storevalue" "optional" "" "help text"
	koi::addarg "" "--SECONDS" "storevalue" "optional" "" "help text"
	koi::addarg "" "--SHELLOPTS" "storevalue" "optional" "" "help text"
	koi::addarg "" "--SHLVL" "storevalue" "optional" "" "help text"
	koi::addarg "" "--TMOUT" "storevalue" "optional" "" "help text"
	koi::addarg "" "--UID" "storevalue" "optional" "" "help text"
	koi::addarg "" "--koiname" "storevalue" "optional" "" "help text"
	koi::addarg "" "--koidescription" "storevalue" "optional" "" "help text"
	koi::addarg "" "--koihelpmenuprefix" "storevalue" "optional" "" "help text"
	koi::addarg "" "--koiwordwraplength" "storevalue" "optional" "" "help text"
	koi::addarg "" "--koishowhints" "storevalue" "optional" "" "help text"
	koi::addarg "" "--koicolorprimary" "storevalue" "optional" "" "help text"
	koi::addarg "" "--koicolorsecondary" "storevalue" "optional" "" "help text"
	koi::addarg "" "--koirequirehelpactions" "storevalue" "optional" "" "help text"
	koi::parseargs "$@"
	echo "done"
}

# ========= ASSERTIONS ========= #
function koitest_run {
	runtest test_longoption_invalid_missing __error__ "-a" "arg"
	runtest test_longoption_invalid_starts_with_number __error__ "--9a" "arg"
	runtest test_longoption_invalid_single_dash __error__ "-aaa" "arg"
	runtest test_longoption_invalid_non_alphanumeric __error__ "--aa-a" "arg"
	runtest test_longoption_invalid_non_unique __error__ "--aaa" "arg"
	runtest test_longoption_invalid_positionalvalue __error__ "aaa"
	runtest test_longoption_invalid_positionalarray __error__ "aaa"
	runtest test_longoption_invalid_illegal_names __error__ "--BASH" "bash"
}