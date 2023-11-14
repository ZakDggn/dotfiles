#!/bin/bash

for i in 1 5 8; do
    find /usr/share/man/man${i}/ -type f -printf '%f\n' | sed -E "s/\.${i}\.gz//"
done
