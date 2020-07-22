#!/bin/bash
#remove existing .git data
#rm -rf .git
#remove existing txt files
#rm *.txt

#reinitialize git
#git init

#the hooks scripts are noise here; remove them
#rm .git/hooks/*

for i in 1 2 3
do
  echo "M$i" > M$i.txt
  git add M$i.txt
  git commit -m "M$i"
done

git checkout -b feature

for i in 1 2 3 4
do
  echo "F$i" > F$i.txt
  git add F$i.txt
  git commit -m "F$i"
done
