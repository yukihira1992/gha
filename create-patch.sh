#!/bin/bash

python main.py > date.txt

if [ -n "$(git status --porcelain)" ]; then
    git remote set-url origin https://yukihira1992:${GITHUB_TOKEN}@github.com/yukihira1992/gha.git
    git config --local user.name "yukihira1992"
    git config --local user.email "ykhr0130@gmail.com"
    python next_patch.py `cat version.txt` > version.txt
    git add date.txt
    git add version.txt
    git commit -m "Updated date."
    NEW_VERSION=`cat version.txt`
    git tag v${NEW_VERSION}
    git push origin HEAD --tags
fi
