#!/bin/bash
#create initial container
#once container is created you can run with 
#docker start eworm
#and connect with 
#docker exec -it eworm /bin/bash
dir=$(dirname $0)
docker run -it --name eworm -v $dir/params:/eworm/run/params joncon/eworm:7.8 /bin/bash