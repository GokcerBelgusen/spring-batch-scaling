#!/bin/sh

kill -9 `jps | grep remote-chunking-slave | awk '{print $1}'`
rm out/*.out
