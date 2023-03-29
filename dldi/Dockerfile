# nb: this image is obtained in your local docker image registry by following instructions in dldi repo. 
FROM dldi:latest as final

# install utilities needed for analysis
RUN apt-get install -y time 

COPY ./bin /benchmark-bin
