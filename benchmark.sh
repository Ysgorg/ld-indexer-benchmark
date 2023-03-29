#!/bin/bash 
set -e

function usage() {
    echo "Usage: $0 (dldi|hdt) (index|query|export) <dataset name>"
}

application=$1
if [[ $application != dldi && $application != hdt ]]; then
    usage && exit 1
fi

task=$2
if [[ $task != index && $task != query && $task != export ]]; then
    usage && exit 1
fi

dataset=$3
if [[ -z $3 ]]; then 
    echo "dataset not specified. " && usage && exit 1
fi
if [[ ! -f "data/source/${dataset}/data.nt" ]]; then 
    echo "file not found: data/source/${dataset}/data.nt" && usage && exit 1
fi

HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $HERE

DOCKER_BUILDKIT=1 docker build -f $application/Dockerfile -t ld-indexer-$application --target final ./$application

# Docker container options
#
# `--rm`: 
#       remove container after running.
#
# `--security-opt seccomp=unconfined`: 
#       this is needed to avoid some performance hits. 
#
# `-v $(pwd)/data/source/${dataset}:/data/source:ro`: 
#       persistent read-only data folder, for the source data. 
#
# `-v $(pwd)/data/index/${application}/${dataset}:/data/index`: 
#       volume for storing the generated indexed data structures. 
#       generated by indexing job, read by query and export jobs. 
#
# `-v $(pwd)/data/results/${application}/${dataset}/${task}:/data/results`:
#       volume dedicated for benchmarking output, in raw form. 
#       to be used by a data processing script later on. 
#


docker run \
    --rm -it \
    --security-opt seccomp=unconfined \
    -v $(pwd)/data/source/${dataset}:/data/source:ro \
    -v $(pwd)/data/index/${application}/${dataset}:/data/index \
    -v $(pwd)/data/results/${application}/${dataset}/${task}:/data/results \
    ld-indexer-$application \
    /benchmark-bin/$task.sh
    # /bin/bash