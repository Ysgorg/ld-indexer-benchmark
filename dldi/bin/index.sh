#!/bin/bash
set -e 
rm -rf /data/index/dldi
/usr/bin/time -v ./Release/dldi compose -a /data/source/data.nt /data/index/dldi 2> /data/results/benchmark.txt
