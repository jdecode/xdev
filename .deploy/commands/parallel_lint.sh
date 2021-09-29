#!/bin/bash
# Laravel boilerplate githook script

PHP Lint
if [[ $CIRCLECI == true ]]
then
    composer run parallel-lint
else
    docker exec xdev-web composer run parallel-lint
fi


RESULT=$?
[[ $RESULT -eq 0 ]] &&
echo -e "\e[32m\n\t***************************\n\t*  PHP lint check passed  *\n\t***************************\n\n"

exit $RESULT
