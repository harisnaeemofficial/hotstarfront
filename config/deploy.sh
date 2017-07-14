#!/bin/bash
if [ "$TRAVIS_BRANCH" == "master" ]; then
  git config --global user.email "anil@3dvirtuallabs.com"
  git config --global user.name "anil_3dvirtuallabs"
  npm run build:prod
  npm run copy:domain
  npm run copy:heroku
  if [ -d "./dist" ]; then
    echo "PRODUCTION BUILD CREATED";
    cd dist
    git init
    git add .
    git commit -am "deployed commit from anil_3dvirtuallabs"
    git push heroku master
  else
    echo "!!! PRODUCTION BUILD FAILED !!!";
  fi
fi
