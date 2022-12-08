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
  #create two changes on the second commit. We will split this commit
  if [ $i -eq 2 ]; then
    echo "M2-first-update" > M2-first-update.txt
    echo "M2-second-update" > M2-second-update.txt
    git add M2-first-update.txt
    git add M2-second-update.txt
    git commit -m "M$i"
  else
    echo "M$i" > M$i.txt
    git add M$i.txt
    git commit -m "M$i"
  fi
  
done
