FROM arm32v7/ubuntu:xenial
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get install -y \
    python-rosinstall python-rosinstall-generator python-wstool build-essential \
    apt-utils tk-dev wget python3 python3-pip dirmngr gnupg2 lsb-release libssl-dev vim

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116
# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list
# install bootstrap tools
RUN apt-get update && apt-get install -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools 
# install ros packages
ENV ROS_DISTRO kinetic
RUN apt-get update && apt-get install -y \
    ros-kinetic-ros-base && echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
# bootstrap rosdep
RUN rosdep init \
    && rosdep update
