# paperwork-docker
Dockerfiles for creating a container running jflesch/paperwork 


The Dockerfile is based on Ubuntu. Therefore the user paperwork is run as has uid=1000 by default. 
If you are using a different distribution on your host system or have several users the uids might
not match. In that case you have to adjust the uid in the Dockerfile's "adduser"-line.


Build with 

docker build -t paperwork .

then run with

docker run -ti --rm  -e DISPLAY=$DISPLAY -e HOME=/home/paperworker --privileged=true -v /dev/bus/usb:/dev/bus/usb -v /tmp/.X11-unix:/tmp/.X11-unix paperwork /bin/bash


