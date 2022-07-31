#!/bin/bash
set -e

: <<- COMMENT
To use koi:
  1. source the koi script
  2. override the 'koiname' variable with the name of your script
  3. override the 'koidescription' variable with the description of your script

To add arguments:
  1. add arguments to each function with koi::addarg
  2. parse the arguments with koi::parseargs "$@"

To run the script, use the koi::run function at the very end of the script:
  koi::run "$@"
COMMENT

source ../../koi
koiname=workflow_example.sh
koidescription="Examples of potential workflow-related commands you could make with koi"
koicolors=0

# Here's an example of of koi only using long options (starting with --)
function start {
	koi::addarg "-h" "--help" "help" "optional" "" "Start a workflow given a workflow script"
	koi::addarg "" "script" "positionalvalue" "required" "" "The workflow script"
	koi::addarg "" "--name" "storevalue" "required" "" "The name of the workflow"
	koi::addarg "" "--user" "storevalue" "optional" "`whoami`" "The workflow user"
	koi::parseargs "$@"

	# start your workflow!
}

function checkstatus {
	koi::addarg "-h" "--help" "help" "optional" "" "Check the status of an existing workflow"
	koi::addarg "" "--name" "storevalue" "required" "" "The name of the workflow to check"
	koi::parseargs "$@"

	# check your workflow
}

koi::run "$@"
