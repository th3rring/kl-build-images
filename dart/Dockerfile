FROM ros:melodic-ros-base
MAINTAINER Thomas Herring teh6@rice.edu


RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:dartsim/ppa &&\
    apt-get install -y ros-${ROS_DISTRO}-moveit-*\ 
    python-catkin-tools\ 
    libdart6-all-dev\
    g++\
    cmake\ 
    pkg-config\ 
    libboost-all-dev\
    libeigen3-dev\ 
    libode-dev\ 
    wget\ 
    libyaml-cpp-dev\
    libhdf5-dev\
    ros-${ROS_DISTRO}-fetch-ros\
    ros-${ROS_DISTRO}-urdf\
    ros-${ROS_DISTRO}-collada-urdf && \
    rm -rf /var/lib/apt/lists/*

ENV user_name=dart
RUN  useradd -ms /bin/bash $user_name && echo $user_name:$user_name | chpasswd && \
        adduser $user_name sudo && \
        echo "$user_name ALL=(ALL) ALL" >> /etc/sudoers && \
        ln -s /Workspace /home/$user_name/Workspace

USER $user_name
WORKDIR /home/$user_name
