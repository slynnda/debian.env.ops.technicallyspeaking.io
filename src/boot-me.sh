#!/bin/sh

# Executes project-level environmental configuration and boot sequence for user

PROJECT_NAME=technicallyspeaking.io
HEADER=INFO

echo "Installing $PROJECT_NAME development environment for Google Cloud Platform"

echo "  Installing component: profile"
PROFILE_SRC=https://raw.githubusercontent.com/technicallyspeaking/debian.env.ops.technicallyspeaking.io/master/src/profile
PROFILE_TARGET=~/.profile
echo "    - Source Location: $PROFILE_SRC"
echo "    - Target Location: $PROFILE_TARGET"
wget -q -O - $PROFILE_SRC > $PROFILE_TARGET
echo "    $HEADER: Source downloaded and written to target location"
source $PROFILE_TARGET
echo "    $HEADER: Component installation complete" 

echo "Finished installing $PROJECT_NAME development environment for Google Cloud Platform"
