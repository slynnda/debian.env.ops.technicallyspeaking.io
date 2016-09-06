#!/bin/sh

# Executes project-level environmental configuration and boot sequence for user

PROJECT_NAME=technicallyspeaking.io
HEADER=INFO

echo "Installing $PROJECT_NAME development environment for Google Cloud Platform"

echo "  Installing component: technicallyspeaking.init"
INIT_SRC=https://raw.githubusercontent.com/technicallyspeaking/debian.env.ops.technicallyspeaking.io/master/src/technicallyspeaking.init
INIT_TARGET=/etc/init.d/technicallyspeaking.init
echo "    - Source Location: $INIT_SRC"
echo "    - Target Location: $INIT_TARGET"
sudo wget -q -O - $INIT_SRC > $INIT_TARGET
echo "    $HEADER: Source downloaded and written to target location"
source $INIT_TARGET
echo "    $HEADER: Component installation complete" 

echo "Finished installing $PROJECT_NAME development environment for Google Cloud Platform"
