#!/bin/bash

seq 10 | awk -v S=0 -v E=99 'BEGIN {srand()} {for (i=0; i<10; i++) printf("%d ", int(rand() * (E-S+1) + S)); printf("\n") }'
