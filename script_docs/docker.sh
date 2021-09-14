#!/usr/bin/env bash

### TOP CMD
# docker build -t image_name -f . .
# docker container run --name <new-container-name> <image>
# docker create --name <new-container-name> <image>
# docker start <container> -a ### -a is in attached mode
# docker exec -it <container-name> /bin/bash ### exit shell ^C ^D

# docker network create <network-name>
# docker network ls
# docker run -p 27017:27017 -d mongo

# docker images
# docker ps -a
# docker rm <container>
# docker rmi <image>
# docker container prune

# Configure to map
# docker build . -t <name>
# docker run <name> -p 5300:8000 ### first is exposed to public second is internally (App port)
# expose port...

#-------
# ENTRYPOINT ["tail", "-f", "/dev/null"]
# The tail -f /dev/null is a common idiom for keeping a container alive indefinitely if the "real" command isn't long-lived
### To keep open

# docker build - < Dockerfile
# docker build -f /path/to/a/Dockerfile . # eg docker build -f . .
# docker build -t image_name -f . . # builds with name
### builds docker image

# docker container run --name <container-name> <image>
### creates docker container from image and runs it

# docker container run -it <docker-image> /bin/bash OR /bin/sh
# start container in interactive mode -IF ENTRYPOINT SPEC-

# docker start -i <container> # start interactive

# docker exec -it <container-name> /bin/bash
### bash shell into container - needs to be running in different process

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
