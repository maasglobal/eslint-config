#!/usr/bin/env bash

# if master branch and not a pull request
if [ $TRAVIS_BRANCH == 'master' ] && [ -z $TRAVIS_PULL_REQUEST_BRANCH ]
then
  latest=$(npm info eslint-config-maasglobal dist-tags.latest) &&
  git tag v${latest} &&
  git push https://maasglobal:$GITHUB_API_TOKEN@github.com/maasglobal/eslint-config-maasglobal v${latest}
else
  echo "Package is tagged only from master branch" &&
  exit 1
fi
