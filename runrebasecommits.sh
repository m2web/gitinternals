#!/bin/bash

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

git checkout master

for i in 4 5
do
  echo "M$i" > M$i.txt
  git add M$i.txt
  git commit -m "M$i"
done