from debian:bookworm-slim as final

RUN apt-get update && apt-get install -y git 

WORKDIR /

RUN git clone https://github.com/rdfhdt/hdt-cpp.git 

# documented dependencies
RUN apt-get install -y autoconf libtool zlib1g zlib1g-dev pkg-config libserd-0-0 libserd-dev 

# undocumented dependencies
RUN apt-get install -y build-essential

#documented installation steps
WORKDIR /hdt-cpp
RUN ./autogen.sh
RUN ./configure 
RUN make -j$(nproc) 
RUN make install

#undocumented installation steps
RUN ldconfig

# install utilities needed for analysis
RUN apt-get install -y time 

COPY ./bin /benchmark-bin