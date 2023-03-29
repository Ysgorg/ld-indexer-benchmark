#!/bin/bash

HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $HERE

DATA_DIR=data/source
mkdir -p $DATA_DIR

# download each of the source files, extract them, and create sample subsets. 
if [ ! -f $DATA_DIR/dbpedia.nt ]; then 
    mkdir -p $DATA_DIR/dbpedia
    wget "https://triplydb.com/DBpedia-association/dbpedia/download.nt" -O $DATA_DIR/dbpedia/data.nt.gz
    gunzip $DATA_DIR/dbpedia/data.nt.gz
fi
if [ ! -f $DATA_DIR/kadaster.nt ]; then 
    mkdir -p $DATA_DIR/kadaster
    wget "https://data.labs.kadaster.nl/kadaster/kg/download.nt.gz?graph=https%3A%2F%2Fdata.labs.kadaster.nl%2Fkadaster%2Fkg%2Fgraphs%2Fbrt-gebouw" -O $DATA_DIR/kadaster/data.nt.gz
    gunzip $DATA_DIR/kadaster/data.nt.gz
fi
if [ ! -f $DATA_DIR/energie.nt ]; then 
    mkdir -p $DATA_DIR/energie
    wget "https://triplydb.com/rvo/energielabels/download.nt" -O $DATA_DIR/energie/data.nt.gz 
    gunzip $DATA_DIR/energie/data.nt.gz
fi

