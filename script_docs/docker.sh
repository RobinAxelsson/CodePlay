#!/usr/bin/env bash

# docker run [OPTIONS] <image> <command> args...
### builds and runs containers from images, if its not in your system it pulls from dockerhub
# docker run <docker-image>
# docker container run ### new syntax?

# docker create --name <new-container-name> <image-name>
# creates container

# docker container run -it <docker-image> /bin/bash    #### Works
# start container in interactive mode

# docker exec -i -t /bin/bash
### bash shell into container

# ^C ^D
### Exit container shell

# ^P^Q
### Exit without stopping the container

# docker system df
### displays disk utilization

# docker run <name>
### runs a docker container

# docker cp
### copies files from running container to the host or other way around.

# docker build
### builds Docker images from a Dockerfile and a "context"

# docker build - < Dockerfile
### pipes a single dockerfile without repo or context

# docker-compose up -d
### aggregates the output of each container
### When the command exits, all containers are stopped

# docker-compose down
# docker commit

# docker ps
### displays running containers

# docker ps -a
### displays running and stopped containers

# -q flag gives ID! #

# docker container stop $(docker ps -q)
# docker container kill $(docker ps -q)
### stops/kills all containers

# docker container prune
### removes all unused containers

# docker images
### displays all images

# docker rmi $(docker images -q)
### removes all images

# docker pull <image-name>
# eg docker pull alpine
### download image from Docker Hub registry
