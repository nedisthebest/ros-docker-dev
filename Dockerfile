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
    python3-pip \
    tmux \
    neovim \
    && rm -rf /var/lib/apt/lists/*

RUN echo "yes" | pip3 install scipy

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

RUN sudo apt-get install --no-install-recommends -y python3-rosinstall \
  cmake python3-catkin-pkg python3-empy python-nose python-setuptools libgtest-dev build-essential \
  python3-catkin-tools

RUN rm -rf /var/lib/apt/lists/*

RUN sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

RUN rm -rf /var/lib/apt/lists/*

RUN echo "cd /ros_ws/" >> ~/.zshrc
RUN echo "source /ros_ws/devel/setup.zsh" >> ~/.zshrc

# Set the entrypoint to source ROS setup.zsh and run a z shell instance
CMD ["/bin/zsh"]
