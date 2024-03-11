# Use the official ROS image as the base image
FROM ros:noetic-ros-core-focal

# Set shell for running commands
SHELL ["/bin/bash", "-c"]

# install bootstrap tools
RUN apt-get update  && apt update && apt-get install --no-install-recommends -y \
    build-essential \
    git \
    zsh \
    wget \
    ros-noetic-desktop-full \
    && rm -rf /var/lib/apt/lists/*

    
RUN chsh -s $(which zsh)

RUN echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc

RUN sudo sh \
    -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" \
        > /etc/apt/sources.list.d/ros-latest.list'

RUN wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

RUN sudo apt-get update

RUN sudo apt-get install python3-rosdep

RUN sudo rosdep init

RUN rosdep update

RUN sudo apt-get install python-rosinstall \
  cmake python3-catkin-pkg python3-empy python-nose python-setuptools libgtest-dev build-essential

RUN echo "cd /ros_ws/" >> ~/.zshrc

# Set the entrypoint to source ROS setup.zsh and run a z shell instance
CMD ["/bin/zsh"]
