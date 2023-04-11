from debian:bookworm-slim as final

RUN apt-get update && apt-get install -y cmake git g++ zlib1g-dev && \
    git clone https://github.com/karmaresearch/trident.git /tmp/trident && \
    cd /tmp/trident && \
     mkdir build && \
     cd build 

RUN cd /tmp/trident/build &&    cmake .. -DSPARQL=1 && \
     make 

COPY ./bin /benchmark-bin

# install utilities needed for analysis
RUN apt-get install -y time 