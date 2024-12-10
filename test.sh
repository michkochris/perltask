#!/bin/bash

files=(linux64.h t-linux64)

./copy.sh
./perl.sh
for f in "${files[@]}" ; do
    cp $f perl1-$f
done

./copy.sh
./perlscript.pl
for f in "${files[@]}" ; do
    cp $f perl2-$f
done


./copy.sh
./sedscript.sh
for f in "${files[@]}" ; do
    diff $f perl1-$f
    diff $f perl2-$f
done

# Cleanup
./copy.sh
