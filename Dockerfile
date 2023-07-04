FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
    dash \
    build-essential \
    unzip \
    cmake \
    git \
    make \
    gpp \
    gcc \
#    liblas-dev \
    libtiff5-dev \
    libgeotiff-dev \
    libboost-dev \
    libboost-program-options-dev \
    libboost-iostreams-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libboost-filesystem-dev \
    libboost-date-time-dev \
    libboost-regex-dev \
    libboost-test-dev \
    libboost-math-dev \
    libboost-python-dev \
    libgdal-dev \
    libproj-dev \
    python3 \
    python3-pip && \
    g++ --version && \
    gcc --version && \
    cmake --version && \
    make --version

ENV LC_ALL=C
ENV LANG=C.UTF-8
ENV LANGUAGE=en_US.UTF-8

# POSIX bourne shell only
RUN rm /bin/sh && ln -s /bin/dash /bin/sh

WORKDIR /build

COPY src ./src
COPY bin ./bin
COPY data ./data
COPY LASlib ./LASlib
COPY LASzip ./LASzip
COPY data ./data
COPY example_batch_scripts ./example_batch_scripts
COPY CMakeLists.txt ./
COPY Makefile ./

#RUN git clone https://github.com/LAStools/LAStools.git
#WORKDIR /app/LAStools

#RUN ./make.py -cores 2
#RUN unzip LAStools.zip && cd LAStools/make

RUN ls -la && \
    make && \
    ./bin/lasinfo -h
