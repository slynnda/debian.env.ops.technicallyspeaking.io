#!/bin/bash

# Executes project-level environmental configuration and boot sequence for user

PROJECT_NAME=technicallyspeaking.io
HEADER=INFO

echo "Installing $PROJECT_NAME development environment for Google Cloud Platform"

echo "  Installing component: bashprofile"
BASHPROFILE_SRC=https://raw.githubusercontent.com/technicallyspeaking/debian.env.ops.technicallyspeaking.io/master/src/bashprofile
BASHPROFILE_TARGET=~/.bashprofile
echo "    - Source Location: $BASHPROFILE_SRC"
echo "    - Target Location: $BASHPROFILE_TARGET"
wget -q -O - $BASHPROFILE_SRC > $BASHPROFILE_TARGET
echo "    $HEADER: Source downloaded and written to target location"
source $BASHPROFILE_TARGET
echo "    $HEADER: Component installation complete" 

echo "Finished installing $PROJECT_NAME development environment for Google Cloud Platform"
