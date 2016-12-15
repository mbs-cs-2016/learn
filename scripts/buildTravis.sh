#!/usr/bin/env bash

# Let's build the docs
mkdocs build

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
