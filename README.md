#eworm-docker
A simple docker container for earthworm
##Usage 

<code>./ew_containerize</code>

This will pull the necessary files and create the docker container

Once the container is created you can start it with

<code>docker start eworm</code>

And shell into it with

<code>docker exec -it eworm /bin/bash </code>

Stop eworm-docker with

<code>docker stop eworm</code>

##Configuration
Add any configure files from /eworm/earthworm_[version]/params to /eworm/run/params

