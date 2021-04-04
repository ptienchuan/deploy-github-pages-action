#!/usr/bin/env sh
# abort on errors
set -e

# build
echo "::group::Build for deploy"
npm run build
cd $SOURCE_DIRECTORY
echo "Source code after building"
ls -la
echo "::endgroup::"

echo "::group::Push changes"
git init

git config user.email $USER_EMAIL
git config user.name $USER_NAME

git add -A
git commit -m 'deploy'

git push -f "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git" master:$TARGET_BRANCH
echo "::endgroup::"

cd -
