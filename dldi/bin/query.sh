#!/bin/bash
set -e 

# NB: this set of queries only makes sense for the energie dataset. 
# todo determine a sensible generic approach for benchmarking querying.

# energie is record-oriented, i.e. there's N distinct subjects, and each of them occur in X triples where the predicate is distinct in each pred. 
# so each predicate occurs N times. 
# the object-positioned terms are almost all literals. mostly numeric. They are short and typically reoccur across many different records, 
# by coincidence/pigeonhole principle. 

# filter by a certain predicate
/usr/bin/time -v ./Release/dldi query triples /data/index/dldi \
    -p "https://data.labs.pdok.nl/def/energielabels/pand_huisnummer" \
    > /dev/null 2> /data/results/p.txt

# filter by a certain subject + predicate
/usr/bin/time -v ./Release/dldi query triples /data/index/dldi \
    -s "https://data.labs.pdok.nl/id/energielabel/9205cn_271" \
    -p "https://data.labs.pdok.nl/def/energielabels/pand_huisnummer" \
    > /dev/null 2> /data/results/sp.txt

# filter by a certain predicate + object
/usr/bin/time -v ./Release/dldi query triples /data/index/dldi \
    -s "https://data.labs.pdok.nl/def/energielabels/pand_huisnummer" \
    -o '"10"' \
    > /dev/null 2> /data/results/so.txt
