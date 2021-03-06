#!/bin/bash

color=$1
description=$2
moldtype=$3

cliColor=$4
cliDescription=$5
cliMoldType=$6
# First create a banana profile
cmd-cli profiles create banana-profile "test_banana" --color "$color" --banana-description "$description" --mold-type "$moldtype"
CMDRC=$?
if [ $CMDRC -gt 0 ]
then
    echo "Creating a test_banana profile of type banana failed!" 1>&2
    exit $CMDRC
fi

CMD_CLI_OPT_COLOR="$4" CMD_CLI_OPT_BANANA_DESCRIPTION="$5" CMD_CLI_OPT_MOLD_TYPE="$6" cmd-cli profile mapping
CMDRC=$?
if [ $CMDRC -gt 0 ]
then
    echo "Profile mapping command failed!" 1>&2
    exit $CMDRC
fi
