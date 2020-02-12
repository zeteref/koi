<p align="center"><img alt="koi logo" src="logo.png" /></p>

<h1 align="center">koi</h1>
<p align="center">Bashful argument parsing</p>

## Quick Examples
Easily add command line arguments for Bash functions! Inspired by Python's [argparse](https://docs.python.org/3/library/argparse.html).
```
function send_request {
    __addarg "-h" "--help" "help" "optional" "" "Send an HTTP request"
    __addarg "-m" "--method" "storevalue" "optional" "GET" "The HTTP method"
    __addarg "-u" "--url" "storevalue" "required" "" "The url of the HTTP request"
    __parseargs "$@"
    curl -X "$method" "$url"
}
```
See the full [Usage](#Usage) below.

## Installation
Install via Homebrew:
```
brew install koi
```

## Setup
To start using `koi`, simply source it at the top of your Bash script.
```
#!/bin/bash
source koi
```

Also at the top of your script, but below sourcing `koi`, you should override the `koiname` and `koidescription` variables. These get printed in error messages, help text, etc.:
```
#!/bin/bash
source koi
koiname=nameofscript
koidescription="A longer description of your script"
```

## Usage
`koi` allows you to add CLI arguments + options to Bash functions. `koi` uses three main functions for parsing command line arguments: `__addarg`, `__parseargs`, and `__koirun`.

<details>
<summary><a id="__addarg"><code>__addarg</code></a></summary>

### `__addarg`
**To add a parsable CLI argument to a Bash function, use the `__addarg` function. The `__addarg` function takes six arguments and sets up global variables based on validated command line inputs.**

```
__addarg short_option long_option action is_required default_value help_text
```
 * `short_option` - The short option for the argument, denoted with a dash followed by a letter (i.e. `-h`, `-A`). The short option is usually the first letter of the long option.
 * `long_option` - The long option for the argument, denoted with two dashes followed by a string of alphanumeric characters (i.e. `--help`, `--dir`, `--user`).
 * `action` - The action to take with this option. The supported actions are:
   * `storevalue` - store the value of the argument in a variable
   * `filepath` - store the value of the argument in a variable and check that the value is a path to an existing file
   * `directorypath` - store the value of the argument in a variable and check that the value is a path to an existing directory
   * `flag` - store 1 (true) in a variable
   * `help` - display the help text
   * `exit` - exit the script
 * `is_required` - Whether or not the argument is required, must be either `required` or `optional`.
 * `default_value` - The default value for the argument, if the argument is optional.
 * `help_text` - The help text that is printed when the `-h` option is used.

**`__addarg` does not return anything, but rather sets up variables in the global scope that can be used. The name of the variable will match the argument's `long_option`, without the leading dashes.** Here's an example:
```
function mycoolfunction {
    __addarg "-o" "--outputdir" "directorypath" "required" "" "Path to the output directory"
    __parseargs "$@"
    echo "$outputdir"
}
```
</details>

<details>
<summary><a id="__parseargs"><code>__parseargs</code></a></summary>

### `__parseargs`
**Once all arguments are added to a function with `__addarg`, `koi` parses the arguments with `__parseargs`. `__parseargs` takes in a list of command line arguments and parses them based on the arguments that have been added to the function with `__addarg`.**
```
__parseargs "$@"
```
Where `"$@"` is a list of arguments coming directly from the command line. `__parseargs` must be called after all `__addargs` statements and must include all of the command line arguments to be parsed.
</details>

<details>
<summary><a id="__koirun"><code>__koirun</code></a></summary>

### `__koirun`
**To actually run `koi`, use the `__koirun` function. Include `__koirun "$@"` as the last line in your script for `koi` to operate correctly.**
```
__koirun "$@"
```
All `__koirun` does is search for functions matching command line arguments and run them. This is the code for `__koirun`:
```
if declare -F -- "${1:-}" >/dev/null ; then
    "$@"
else
    __errortext "$koiname: err: no such command '$1'"
    __errortext "Use 'help' for available commands"
    exit 1
fi
```
</details>

To use `koi`, follow these steps:
 1. Use `__addargs` to define arguments for each desired function.
 2. Use `__parseargs` to parse defined arguments for each desired function.
 3. Put `__koirun "$@"` at the bottom of your script to tell `koi` to run.

There are also two additional functions that are included by default: `help` and `list`.

<details>
<summary><a id="help"><code>help</code></a></summary>

### `help`
**Prints a help message for your script. The help message is populated automatically based on the `-h` arguments that you add to your functions with `__addarg`.** You can call `help` three different ways:
```
$ ./nameofscript help
$ ./nameofscript -h
$ ./nameofscript --help
```
**Here's a sample menu generated by `koi`:**
```
$ ./examples/curl_examples help
Examples of potential curl commands you could make with koi

Usage:
  curl_example COMMAND

Available commands:
  createuser
  help
  list
  run
  show

>> curl_example createuser
Create a new user
  -p, --port PORT  Port where server is running (optional) (default: 80)
  -u, --user USER  The name of the user to create 

>> curl_example help
Show this menu and exit

>> curl_example list
List all available commands

>> curl_example run
Run a job/script on the server
  -p, --port PORT      Port where server is running (optional) (default: 80)
  -u, --user USER      Name of user 
  -f, --folder FOLDER  Name of folder where script is located 
  -s, --script SCRIPT  Name of script to run 

>> curl_example show
List running jobs for a given user
  -p, --port PORT  Port where server is running (optional) (default: 80)
  -u, --user USER  Name of user
```
See the code for this example in [`examples/curl_examples`](https://github.com/wcarhart/koi/blob/master/examples/curl_example).

</details>

<details>
<summary><a id="list"><code>list</code></a></summary>

### `list`
**Prints all of the available commands.** `list` will print all functions defined that do not start with a dash (`-`) or underscore (`-`). Functions that begin with dashes and underscores are interpreted as internal functions to `koi` and thus are not print as commands available at the command line. Although they are not printed in `list` and `help`, you can still call them from the command line if you like.

**Here's an example of the output of `list`:**
```
$ ./examples/curl_examples list
createuser
help
list
run
show
```
See the code for this example in [`examples/curl_examples`](https://github.com/wcarhart/koi/blob/master/examples/curl_example).

</details>

## Examples
A few examples are located in the [`examples/`](https://github.com/wcarhart/koi/tree/master/examples) folder. Within them is a template that shows all of the available argument options with `koi` (located in `examples/koi_template`).

## Caveats
Due to the fact that `koi` is written in Bash, its implementation comes with a few gotchas:
 * When `koi` defines a variable, it is in the global scope. Thus, if two different functions add a `--user` option, the variable `$user` will be overwritten by whatever function is called most recently.
 * The variable `koiname` needs to match script name exactly for it to function properly.
 * Scripts that source `koi` cannot have a file ending (i.e. no `.sh`). Generally, if you writing in Bash, you shouldn't include the `.sh` ending anyways, but including it with `koi` causes `koi` to not be able to find source files.
 * Because of the flexibility, and lack of protection, inherently built into Bash, the functions `koi` provides (`__addarg`, `__parseargs`, `__koirun`, `help`, and `list`) can all be overwritten if you don't like their implementation.

## Nomenclature
You may ask yourself, why the name `koi`? Well, the original working name of the library was Bashful Arg Parser, which is a mouthful. This was shortened to Bashful, to which "coy" is a synonym. `koi` is a homophone of "coy" and thus was chosen as the name.