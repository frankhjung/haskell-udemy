# Chapter 8 - Functional Programming and Haskell 

The program will read a file containing integers, and perform some basic
calculations, like: 

1. count of entries,
1. total sum of entries
1. mean of entries
1. range of entries

## Prepare test data

To generate the data I used a bash script:

```bash gendata.sh
#!/bin/bash

seq 10 | awk -v S=0 -v E=99 'BEGIN {srand()} {for (i=0; i<10; i++) printf("%d ", int(rand() * (E-S+1) + S)); printf("\n") }'
```

Then write to a file using:

```bash
./gendata.sh > test.data
```

## Build

To build application, `chapter8`:

```bash
make build
```

## Run Main

To execute `chapter8`:

```bash
make exec
```

