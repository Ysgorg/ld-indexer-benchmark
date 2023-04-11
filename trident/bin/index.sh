#!/bin/bash
set -e 
rm -rf /data/index/data
/usr/bin/time -v /tmp/trident/build/trident load -f /data/source/data.nt -i /data/index/data 2> /data/results/benchmark.txt
