#!/bin/bash

# This script prepares Debian environment variables for project user

# Create and export some project-level environment variables:
MY_NAME=`printenv USER | sed 's/_/\./g'` && export MY_NAME
MY_PROJECT_DOMAIN=`printenv DEVSHELL_PROJECT_ID | sed 's/-/\./g'` && export MY_PROJECT_DOMAIN
MY_PROJECT_NAME=`printenv DEVSHELL_PROJECT_ID | sed 's/-io//g'` && export MY_PROJECT_NAME
MY_PROJECT_ROOT=~/$MY_PROJECT_NAME && export MY_PROJECT_ROOT
MY_EMAIL=$MY_NAME@$MY_PROJECT_DOMAIN && export MY_EMAIL
MY_ENVIRONMENT_ID=`uname -a | md5sum | cut -f1 -d" "` && export MY_ENVIRONMENT_ID

# Wipe any previous clutter:
rm -rf $MY_PROJECT_ROOT


