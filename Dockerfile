#!/bin/bash

# DESCRIPTION: Script To Create A Dockerfile TO Build An Image And Run A Container
# This Script Can Be Push To Dockerhub If Needed {Tag Docker ID/Image Name In ENV1 And} Exec Docker Push In ENV5} 
# Enveroment One (ENV1) Is For Modification
# AUTHOR: Ladbam Email: kloversolutions@outloo.com
# Date: Dec 04, 2021

#ENV1
# Dockerfile Questions [Variables]
 Version=ubuntu:18.04
 LABEL=group5@utrain.com
 DAEMON=apache2
 C_INST=apt
 EXP=80
 PTH=/usr/local/apache2/htdocs  #Idex Content [Exec index.html in ENV2]
 NAME_TAG=ladbam/group5-apache22
 TCP=700:80

#ENV2
# Dockerfile Script
 echo "FROM $Version" > Dockerfile
 echo "MAINTAINER $LABEL" >> Dockerfile

 echo "RUN $C_INST update -y" >> Dockerfile
 echo "RUN $C_INST install $DAEMON -y" >> Dockerfile
 echo "RUN $C_INST clean all" >> Dockerfile
 ##     echo "RUN systemctl enable $DAEMON.service" >> Dockerfile

## echo "RUN $C_INST -y install vim" >> Dockerfile
## echo "RUN $C_INST -y install finger" >> Dockerfile
## echo "RUN $C_INST -y install curl" >> Dockerfile
## echo "RUN $C_INST -y install zip" >> Dockerfile

 echo "EXPOSE $EXP" >> Dockerfile
  ##      echo "COPY ./index.html $PTH" >> Dockerfile
 echo "CMD apachectl -D FOREGROUND" >> Dockerfile

#ENV3
# To Build Docker Image
 echo "Please wait while the Docker image is building...."
 sleep 3
 docker build -t $NAME_TAG .
echo

# To Run Docker Container
 docker run -d -p $TCP $NAME_TAG
echo

#ENV4
# To Checks Docker Info
 docker images
 docker ps
echo
 cat Dockerfile
echo
 rm -f Dockerfile
 if [ $? -eq 0 ]
 then
         echo "Dockerfile removed successfully"
 else
         echo "Dockerfile did not remove"
 fi
 echo

#ENV5
# Push to Docker Hub Repositories
##       docker push $NAME_TAG
if [ $? -eq 0 ]
then
##       echo "AWESOME! $NAME_TAG image successfully pushed to dockerhub repositories."
else
##       echo "$NAME_TAG Failed to push image to dockerhub repositories"
fi
echo
echo "****** Thank You ******"
echo
#END
