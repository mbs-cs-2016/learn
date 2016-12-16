#!/usr/bin/env bash

LEX_DEPLOY=https://github.com/LexBot/Deploy.git
DEPLOY_SCRIPTS=/tmp/mbs-cs/deploy

if [[ $TRAVIS_PULL_REQUEST = false && $TRAVIS_BRANCH = master ]]; then
    # Initialise the ssh-agent
    eval $(ssh-agent)

    # Set up our Git environment
    $DEPLOY_SCRIPTS/setup_git

    # Let's clone the docs repo so that we can commit ontop it
    git clone -b gh-pages git@github.com:mbs-cs/learn.git site

    # Let's build the docs
    mkdocs build

    # Deploy
    cd site
    git add -A .
    git commit -q -m "Deploy $(TRAVIS_COMMIT) from $(TRAVIS_BRANCH)"
    git push -q origin gh-pages
    echo "Done! Successfully published docs!"

    # Kill the ssh-agent because we're done with deploying
    eval $(ssh-agent -k)
fi

if [[ $TRAVIS_REPO_SLUG = "mbs-cs/learn" && -n $TRAVIS_BRANCH = master ]]; then
    # Initialise the ssh-agent
    eval $(ssh-agent)

    # Set up our Git environment
    $DEPLOY_SCRIPTS/setup_git

    # Let's clone the docs repo so that we can commit ontop it
    git clone -b gh-pages git@github.com:mbs-cs/learn.git

    # Let's build the docs
    mkdocs build

    # Deploy
    cp -R ./site/. ./learn/branch/$(TRAVIS_BRANCH)/
    git add -A .
    git commit -q -m "Deploy $(TRAVIS_COMMIT) from $(TRAVIS_BRANCH)"
    git push -q origin gh-pages
    echo "Done! Successfully published docs!"

    # Kill the ssh-agent because we're done with deploying
    eval $(ssh-agent -k)
fi
