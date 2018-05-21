FROM node:6.9.4

RUN apt-get update && \
    apt-get -y install git && \
    apt-get -y install ftp && \
    apt-get -y install git-ftp && \
    apt-get -y install lftp