FROM debian:jessie
MAINTAINER maintainer@codeship.com

ENV PACKAGE_DEPENDENCIES build-essential g++ flex bison gperf ruby perl \
  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
  libpng-dev libjpeg-dev python libx11-dev libxext-dev git

RUN apt-get update && \
    apt-get install -y $PACKAGE_DEPENDENCIES && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

RUN git clone git://github.com/ariya/phantomjs.git
WORKDIR /app/phantomjs
RUN git checkout 2.0.0
RUN ./build.sh --jobs 8 --confirm
