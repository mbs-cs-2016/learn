#!/usr/bin/env bash

LEX_DEPLOY=https://github.com/LexBot/Deploy.git
DEPLOY_SCRIPTS=/tmp/mbs-cs/deploy

# Install the project's dependencies through pip
pip install -r ./etc/requirements.txt

# Get the deploy scripts
git clone $LEX_DEPLOY $DEPLOY_SCRIPTS

# Initialize the ssh-agent
eval $(ssh-agent)

# Set up our Git environment
$DEPLOY_SCRIPTS/setup_git
