#!/bin/bash

# This script prepares a Debian environment for a project user

# Create and export some project-level environment variables:
MY_NAME=`printenv USER | sed 's/_/\./g'` && export MY_NAME
MY_PROJECT_DOMAIN=`printenv DEVSHELL_PROJECT_ID | sed 's/-/\./g'` && export MY_PROJECT_DOMAIN
MY_PROJECT_NAME=`printenv DEVSHELL_PROJECT_ID | sed 's/-io//g'` && export MY_PROJECT_NAME
MY_EMAIL=$MY_NAME@$MY_PROJECT_DOMAIN && export MY_EMAIL
MY_ENVIRONMENT_ID=`uname -a | md5sum | cut -f1 -d" "` && export MY_ENVIRONMENT_ID

# Create an SSH key-pair to identify the user with this environment:
SSH_KEY_DIR=~/.ssh/$MY_PROJECT_NAME
SSH_KEY_FILE=$MY_NAME.$MY_ENVIRONMENT_ID.$MY_PROJECT_DOMAIN.id.rsa
mkdir -p $SSH_KEY_DIR
ssh-keygen -t rsa -b 4069 -C "$MY_NAME@env-$MY_ENVIRONMENT_ID.$MY_PROJECT_DOMAIN" -f $SSH_KEY_DIR/$SSH_KEY_FILE
eval $(ssh-agent -s) && ssh-add

# Setup Git user information:
git config --global user.name "$MY_NAME"
git config --global user.email "$MY_EMAIL"

# Clone projects from GitHub:
GITHUB_DIR=~/github/$MY_PROJECT_NAME
mkdir -p $GITHUB_DIR
git clone https://github.com/technicallyspeaking/debian.env.ops.technicallyspeaking.io.git $GITHUB_DIR/debian-env-ops
git clone https://github.com/technicallyspeaking/nodejs.ops.technicallyspeaking.io.git $GITHUB_DIR/nodejs-ops
git clone https://github.com/technicallyspeaking/markdown.content.technicallyspeaking.io.git $GITHUB_DIR/markdown-content
git clone https://github.com/technicallyspeaking/web.client.technicallyspeaking.io.git $GITHUB_DIR/web-client
git clone https://github.com/technicallyspeaking/web.server.technicallyspeaking.io.git $GITHUB_DIR/web-server
