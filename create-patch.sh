#!/bin/bash

python main.py > date.txt

if [ -n "$(git status --porcelain)" ]; then
    git remote set-url origin https://yukihira1992:${GITHUB_TOKEN}@github.com/yukihira1992/gha.git
    git config --local user.name "yukihira1992"
    git config --local user.email "ykhr0130@gmail.com"
    git add date.txt
    git commit -m "Updated date."
    TAG=`cat /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1`
    git tag $TAG
    git push origin HEAD --tags
fi
