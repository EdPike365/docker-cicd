#!/bin/bash
# ~/dev/docker-cicd/status-stack.sh

# jenkins network
JENKINS_NETWORK=$(docker network inspect jenkins 2>&1)
if [ "$?" -eq 0 ];
then
  echo "Jenkins network exists."
else  
  echo "Jenkins network DOES NOT exist."
fi

# jenkins containe
CONTAINERID=$(docker container inspect jenkins 2>&1)
if [ "$?" -eq 0 ];
then
  echo "Jenkins container exists."
else
  echo "Jenkins container DOES NOT exist."
fi


# jenkins folders
JENKINS_DATA=$(docker volume inspect jenkins-data 2>&1)
if [ "$?" -eq 0 ];
then
  echo "Volume jenkins-data exists."
else
  echo "Volume jenkins-data DOES NOT exist."
fi

JENKINS_DOCKER_CERTS=$(docker volume inspect jenkins-docker-certs 2>&1)
if [ "$?" -eq 0 ];
then
  echo "Volume jenkins-docker-certs exists."
else
  echo "Volume jenkins-docker-certs DOCES NOT exist."
fi

# SCM tokens env vars
if [[ ! -z "$HOST_SCM_USERNAME" ]]
then
  echo "Host SCM username exists."
else
  echo "Host SCM username was empty."
fi

if [[ ! -z "$HOST_SCM_TOKEN" ]]
then
  echo "Host SCM token exists."
else
  echo "Host SCM token was empty."
fi
