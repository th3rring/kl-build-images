FROM ubuntu:bionic
MAINTAINER Thomas Herring teh6@rice.edu

# Requires OMPL private repo on the MMP branch, must be built locally.
COPY ompl-private /ompl-private

RUN apt-get update && \
    apt-get install -y \
        build-essential  \
        castxml \
        cmake \
        git \
        libboost-filesystem-dev \
        libboost-numpy-dev \
        libboost-program-options-dev \
        libboost-python-dev \
        libboost-serialization-dev \
        libboost-system-dev \ 
        libboost-test-dev \
        libeigen3-dev \
        libexpat1 \
        libflann-dev \
        libode-dev \
        libtinfo5 \
        libtriangle-dev \
        pkg-config \
        python3-dev \
        python3-numpy \
        python3-pip \
        wget && \
    cd ompl-private && \
    mkdir -p build/Release && \
    cd build/Release && \
    cmake ../.. && \
    make  && \
    make install

ENV user_name=ompl
RUN  useradd -ms /bin/bash $user_name && echo $user_name:$user_name | chpasswd && \
        adduser $user_name sudo && \
        echo "$user_name ALL=(ALL) ALL" >> /etc/sudoers && \
        ln -s /Workspace /home/$user_name/Workspace

USER $user_name
WORKDIR /home/$user_name
