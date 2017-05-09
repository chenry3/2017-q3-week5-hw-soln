#!/bin/bash

# build our image and tag it 'bind9-local'
docker build -t 'bind9-local' .

# run our container
# detach the container
# always restart our container if it stops
# name our container 'bind' so we can reference it later
# setup DNAT forward of TCP port 53 -> container
# setup DNAT forward of UDP port 53 -> container
# bind mount named.conf.local from our host into the container
# bind mount named.conf.options from our host into the container
# run our bind9-local image (built in step 1)
sudo docker run \
-d \
--restart=always \
--name bind \
-p 53:53/tcp \
-p 53:53/udp \
-v `pwd`/conf/named.conf.local:/etc/bind/named.conf.local:ro \
-v `pwd`/conf/named.conf.options:/etc/bind/named.conf.options:ro \
bind9-local
