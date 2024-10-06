
# docker build -t ansible-core:2.17 .
FROM ubuntu:22.04 AS ansible-core

WORKDIR /root
COPY scripts/ansible-bootstrap.sh .
RUN bash ansible-bootstrap.sh
RUN apt clean


# docker build -t quarcs-base .
FROM ansible-core AS quarcs-base

RUN DEBIAN_FRONTEND=noninteractive \
    apt install --yes \
    astrometry-data-tycho2 \
    astrometry.net \
    build-essential \
    cdbs \
    cmake \
    curl \
    dkms \
    doxygen \
    fxload \
    g++ \
    gcc \
    gettext \
    git  \
    gnome-keyring \
    graphviz \
    libavcodec-dev \
    libavdevice-dev \
    libavformat-dev \
    libboost-dev \
    libboost-regex-dev \
    libcap2-bin \
    libcfitsio-dev \
    libcurl4-gnutls-dev \
    libczmq-dev \
    libdc1394-dev \
    libdrm-dev \
    libev-dev \
    libfftw3-dev \
    libftdi-dev \
    libftdi1-dev \
    libgl1-mesa-dev \
    libgphoto2-dev \
    libgps-dev \
    libgsl-dev \
    libgtk2.0-dev \
    libindi-dev \
    libjpeg-dev \
    libkrb5-dev \
    liblimesuite-dev \
    libnova-dev \
    libpng-dev \
    libqt5charts5-dev \
    libqt5multimedia5-plugins \
    libqt5opengl5-dev \
    libqt5positioning5 \
    libqt5positioning5-plugins \
    libqt5serialport5 \
    libqt5serialport5-dev \
    libqt5svg5-dev \
    libqt5websockets5-dev \
    libraw-dev \
    librtlsdr-dev \
    libswscale-dev \
    libtbb-dev \
    libtbb2 \
    libtheora-dev \
    libtiff-dev \
    libusb-1.0-0-dev \
    libusb-dev \
    libxcb-xinerama0 \
    pkg-config \
    python3-dev \
    python3-numpy \
    qtbase5-dev \
    qtcreator \
    qtmultimedia5-dev \
    qtpositioning5-dev \
    qtscript5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    qtwebengine5-dev \
    subversion \
    wget \
    zlib1g-dev

RUN apt clean

# docker build -t quarcs-module_01 .
FROM quarcs-base AS quarcs-module_01

RUN mkdir /code
COPY . /code/
RUN bash /code/scripts/module_01_server__build.sh
RUN rm -fr /tmp/*
