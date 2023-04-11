#!/bin/bash
set -e 

# NB: streaming result of /usr/bin/time's error output 
# via 2> to /data/results/ doesn't work, it gets complicated due to the echo piping. 
# TODO fix. 

# filter by a certain predicate
/usr/bin/time -v echo 'select * where {?s <https://data.labs.pdok.nl/def/energielabels/pand_huisnummer> ?o}' \
| /tmp/trident/build/trident query -i /data/index/data/ \
> /dev/null 2> /data/results/s.txt

# # filter by a certain subject + predicate
/usr/bin/time -v echo 'select * where {<https://data.labs.pdok.nl/id/energielabel/9205cn_271> <https://data.labs.pdok.nl/def/energielabels/pand_huisnummer> ?o}' \
| /tmp/trident/build/trident query -i /data/index/data/ \
> /dev/null 2> /data/results/sp.txt

# # filter by a certain predicate + object
/usr/bin/time -v echo 'select * where {?s <https://data.labs.pdok.nl/def/energielabels/pand_huisnummer> "10"}' \
| /tmp/trident/build/trident query -i /data/index/data/ \
> /dev/null 2> /data/results/po.txt
