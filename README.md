# Linked-data indexer benchmarker

This repo is for testing different linked-data indexers. 

A linked-data indexer is an application which generates a queryable data structure from plain-text linked data source files. Beyond this basic common denominator, indexers have different design goals and functionalities. This repo should provide an overview of such softwares. 

## Status

Work in progress. 

## Usage 

First, on the host, run `download-data.sh`. You can then run the benchmarks, see `benchmark.sh --help`. 

## things to consider

it's not obvious how to do proper benchmarking of querying, since determining what sensible queries are is data dependent...

## scope / goals

the benchmarking scripts should ideally cover all important functionality: 

 - indexing
 - different types of querying
 - mutation: merging and subtracting
 - loading
 - persisting to disk
 - ... ???

relevant statistics:
 - peak RSS
 - runtime 
 - disk usage
 - ... ???
 
additionally, the scripts should cover as many of the major linked data indexes as possible. 

ideally, the benchmarking scripts should be data-agnostic. 

benchmarking results should be post-processed and neatly presented. 
