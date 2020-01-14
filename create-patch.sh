#!/bin/bash

python main.py > date.txt

if [ -n "$(git status --porcelain)" ]; then
    LATEST_TAG=`git tag -l --sort=-v:refname | grep -E '^v\d+\.\d+\.\d+' | head -n 1`
    git remote set-url origin https://yukihira1992:${GITHUB_TOKEN}@github.com/yukihira1992/gha.git
    git config --local user.name "yukihira1992"
    git config --local user.email "ykhr0130@gmail.com"
    echo $LATEST_TAG > ./tag.txt
    git add date.txt
    git add tag.txt
    git commit -m "Updated date."
    NEXT_TAG=`python next_patch.py $LATEST_TAG`
    git tag $NEXT_TAG
    git push origin HEAD --tags
fi
