FROM ubuntu:bionic

# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/*

# install packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    dirmngr \
    gnupg2 \
    sudo \
    cmake \
    graphviz \
    build-essential \
    doxygen \
    libeigen3-dev \
    liborocos-kdl-dev \
    libcgal-dev \
    libcgal-qt5-dev \
    libboost-all-dev \
    qtdeclarative5-dev \
    libbox2d-dev \
    && rm -rf /var/lib/apt/lists/*


# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# ENV ROS_DISTRO melodic

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]

ENV user_name=xe2ez
RUN  useradd -ms /bin/bash $user_name && echo $user_name:$user_name | chpasswd && \
        adduser $user_name sudo && \
        echo "$user_name ALL=(ALL) ALL" >> /etc/sudoers && \
        ln -s /Workspace /home/$user_name/Workspace

USER $user_name
WORKDIR /home/$user_name
