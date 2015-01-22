#! /bin/sh

OWNER=$1
REPO=$2

URL=git@github.com:$OWNER/$REPO

git clone $URL --depth 1

cd $REPO
npm uninstall bitcore --save
npm link bitcore
npm i
npm test

code=$?

cd ..

if [[ $code != 0 ]]; then
  echo $OWNER/$REPO >> failure
else
  echo $OWNER/$REPO >> success
fi
