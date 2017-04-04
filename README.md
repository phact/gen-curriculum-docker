# gen-curriculum-docker

#docker gen-curriculum

This is a docker container for gen-curriculum.

##clone the repo: git clone https://github.com/phact/gen-curriculum-docker

##for OSX:

#setup
docker-machine start default
eval $(docker-machine env default)
#a bit of cleanup
docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -aq)
#build
docker build -t gen-curriculum-image .
docker run \
   --net=host -d  \
  -p 0.0.0.0:8080:8080 \
  -p 0.0.0.0:8081:8081 \
  -p 0.0.0.0:1025:1025 \
 --name gen-curriculum gen-curriculum-image
#or for debug
docker run -it --net=host 
       --net=host -d  \
  -p 0.0.0.0:8080:8080 \
  -p 0.0.0.0:8081:8081 \
  -p 0.0.0.0:1025:1025 \
  --name gen-curriculum gen-curriculum-image
docker-machine ip default
##for linux: install docker https://docs.docker.com/engine/installation/linux

add your user to the docker group sudo gpasswd -a ${USER} docker

and refresh newgrp docker

#start docker
service docker start
docker build -t gen-curriculum-image .
docker run \
   --net=host -d  \
  -p 0.0.0.0:8080:8080 \
  -p 0.0.0.0:8000:8000 \
  --name gen-curriculum gen-curriculum-image
  
#or if it's not working run without detaching to troubeshoot
docker run -it \
     --net=host -d  \
  -p 0.0.0.0:8080:8080 \
  -p 0.0.0.0:8000:8000 \
  --name gen-curriculum gen-curriculum-image
