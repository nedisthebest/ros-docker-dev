# Docker development environment for ROS1 (ROS2 under development)

## Prerequisites

Before running this container, ensure you have the following dependencies installed:

Docker: [Engine Only](https://docs.docker.com/engine/install/) or [Desktop GUI](https://docs.docker.com/get-docker/)<br>
(_GUI version highly reccommended for those not familliar with the command line_)

Docker Compose: Comes with Docker Desktop. [Standalone Install](https://docs.docker.com/compose/install/)

### MacOS install

For macOS users, the recommended method of installing Docker and Docker Compose is through Homebrew:
<br>
Install Homebrew by running the following command in your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install Docker and Docker Compose using Homebrew:

```bash
brew install docker docker-compose
```

## Usage

Clone this repo

```bash
git clone https://github.com/nedisthebest/ros-docker-dev.git
cd ros-docker-dev
```

Run the setup script

```bash
./setup.sh
```

Once inside the container, press Ctrl + P followed by Ctrl + Q to exit. <br>
To stop the containers and free up resources, use

```bash
docker-compose stop
```

in the folder where this repo's docker-compose.yml exists. <br>
To restart the containers, use

```bash
docker-compose up -d
```

## Issues

Feel free to report issues, this is currently in beta and is not validated for all systems. Verified on an M1 Apple Silicon Mac.

## Notes

Please note that the setup script requires an **ABSOLUTE** path to your project folder
