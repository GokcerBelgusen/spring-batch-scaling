#!/bin/bash

if [ "$1" == "" ]; then
  echo "Number of slaves must be first arg";
  exit 1;
fi

mkdir -p out

for i in `seq 1 $1`;
do
    java -jar ../target/remote-chunking-slave-1.0.0.BUILD-SNAPSHOT.jar > out/slave-$i.out 2>&1 &
done
