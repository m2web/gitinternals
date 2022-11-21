#!/bin/bash
#remove existing .git data
if [ -d ".git" ]; then
  rm -rf .git
fi

#remove existing txt files
if compgen -G "*.txt" > /dev/null; then
    rm *.txt
fi

#reinitialize git
git init

#rename master branch to main
git branch -m master main

#the hooks scripts are noise here; remove them
rm .git/hooks/*

for i in 1 2 3
do
  echo "M$i" > M$i.txt
  git add M$i.txt
  git commit -m "M$i"
done

git checkout -b feature

for i in 1 2
do
  echo "F$i" > F$i.txt
  git add F$i.txt
  git commit -m "F$i"
done

git checkout main