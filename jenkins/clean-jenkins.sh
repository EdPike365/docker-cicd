#!/bin/bash
CONTAINERID=$(docker ps -aqf "name=jenkins")
if [[ ! -z "$CONTAINERID" ]]
then
  echo "Container named jenkins existed."
  echo "CONTAINERID is $CONTAINERID"
  docker stop $CONTAINERID
  docker rm $CONTAINERID
  echo "Jenkins container stopped and removed."
else
  echo "CONTAINERID was empty, container named jenkins did not exist."
fi
docker volume rm jenkins-data
docker volume rm jenkins-docker-certs
echo "Jenkins volumes removed."
