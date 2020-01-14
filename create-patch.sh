#!/bin/bash

python main.py > date.txt

if [ -z "$(git status --porcelain)" ]; then
    git remote set-url origin https://yukihira1992:${GITHUB_TOKEN}@github.com/yukihira1992/gha.git
    git config --local user.name "yukihira1992"
    git config --local user.email "ykhr0130@gmail.com"
    git add date.txt
    git commit -m "Updated date."
    git push origin HEAD
fi
