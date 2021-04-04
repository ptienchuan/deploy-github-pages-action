#!/usr/bin/env sh
echo $SOURCE_DIRECTORY
echo $TARGET_BRANCH
echo $USER_NAME
echo $USER_EMAIL

# abort on errors
set -e

echo "BEFORE BUILD"
pwd
ls -la

# build
npm run build

# navigate into the build output directory
cd $SOURCE_DIRECTORY

echo "AFTER BUILD"
pwd
ls -la

git init
git config user.email $USER_EMAIL
git config user.name $USER_NAME
git add -A
git commit -m 'deploy'

git push -f "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git" master:$TARGET_BRANCH

cd -
