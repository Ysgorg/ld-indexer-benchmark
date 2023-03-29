#!/bin/bash
set -e 

/usr/bin/time -v rdf2hdt /data/source/data.nt /data/index/hdt -i 2> /data/results/benchmark.txt
