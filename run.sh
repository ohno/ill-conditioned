#!/bin/bash
# convert CRLF → LF before use on WSL/Ubuntu

echo "start"

echo "compile"
gfortran -c main.f95

echo "link"
gfortran -o main main.o -llapack -lblas

echo "run"
./main > results.txt

echo "results"
cat results.txt

echo "end"