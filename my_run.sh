#!/bin/sh

export GDISPLAY=$DISPLAY      # forward X11 display to the host machine
export GUSERNAME=`id -u -n`        # current user's username
export GUID=`id -u`                # current user's user id
export GGROUP=`id -g -n`           # current user's primary group name
export GGID=`id -g`                # current user's primary group id
export GHOME=$HOME                 # current user's home directory
export GSHELL=$SHELL               # current user's shell


name="sdn_container"

if [ "$name" != "$(docker ps -a -f "name=$name" --format '{{.Names}}')" ]; then
    echo "Container does not exist..."
    docker run  --privileged=true -h sdn  --name $name         \
                    -v /tmp/.X11-unix:/tmp/.X11-unix  \
                    -v $XAUTHORITY:/$XAUTHORITY  \
                    -v /lib/modules:/lib/modules      \
                    -v $HOME:$GHOME          \
                    -e DISPLAY=$GDISPLAY              \
                    -e GUSERNAME=$GUSERNAME           \
                    -e GUID=$GUID                     \
                    -e GGROUP=$GGROUP                 \
                    -e GGID=$GGID                     \
                    -e GHOME=$HOME                    \
                    -e GSHELL=$SHELL                  \
                    -e XAUTHORITY=$XAUTHORITY         \
                    -it sdn/2019.1  
fi

if [  $(docker inspect -f {{.State.Running}} $name) ]; then
    echo "Starting container"
    docker start sdn_container
fi
                      

if [ $(docker inspect -f {{.State.Running}} $name) ]; then
    echo "Attaching to container ..."
    docker exec  -w $GHOME -i -t $name /bin/bash
else
    echo "Container not running ..."
fi
