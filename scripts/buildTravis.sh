#!/usr/bin/env bash

LEX_DEPLOY=https://github.com/LexBot/Deploy.git
DEPLOY_SCRIPTS=/tmp/mbs-cs/deploy

# Let's build the docs
mkdocs build

# Initialise the ssh-agent
eval $(ssh-agent)

# Set up our Git environment
$DEPLOY_SCRIPTS/setup_git

# Deploy
cd site
git init
git remote add origin git@github.com:mbs-cs/learn.git
git checkout --orphan gh-pages
git add .
git commit -q -m "Deploy $(date)"
git push -q origin gh-pages
echo "Done! Successfully published docs!"

# Kill the ssh-agent because we're done with deploying
eval $(ssh-agent -k)
