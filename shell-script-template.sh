#!/usr/bin/env bash

# source: https://sharats.me/posts/shell-script-best-practices/

set -o errexit # exit if something fails
set -o nounset # fail if use unset variable
set -o pipefail # fail if pipeline command err

# debug using: TRACE=1 ./script.sh
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi


if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./script.sh arg-one arg-two

This is an awesome bash script to make your life better.

'
    exit
fi

# change to the script’s directory
cd "$(dirname "$0")"

main() {
    echo do awesome stuff
    
    # echo 'Something unexpected happened' >&2 # send errors to stderr
}

main "$@"
