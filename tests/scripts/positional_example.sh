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
koiname=positional_example.sh
koidescription="Examples of how to use positional arguments with koi"

function fetchtweets {
	koi::addarg "-h" "--help" "help" "optional" "" "Fetch a user's tweets"
	koi::addarg "" "apikey" "positionalvalue" "required" "" "Your Twitter API key"
	koi::addarg "" "user" "positionalvalue" "required" "" "The name of the user"
	koi::addarg "-n" "--num" "storevalue" "optional" "10" "The number of tweets to fetch"
	koi::parseargs "$@"
	# fetch tweets
}

function checkstockprice {
	koi::addarg "-h" "--help" "help" "optional" "" "Check a stock's price"
	koi::addarg "" "symbol" "positionalarray" "required" "" "The ticker symbol(s) to check"
	koi::addarg "-e" "--exchange" "storevalue" "optional" "NYSE" "The exchange to use"
	koi::addarg "-p" "--port" "storevalue" "required" "" "The port to use"
	koi::addarg "-q" "--quiet" "flag" "optional" "" "If included, run in quiet mode"
	koi::parseargs "$@"
	# check the stock price
}

koi::run "$@"
