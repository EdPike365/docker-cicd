#!/bin/bash
docker run --name jenkins-dind \
--detach --restart unless-stopped \
--privileged \
--network jenkins --network-alias docker \
--env DOCKER_TLS_CERTDIR="" \
--volume jenkins-docker-certs:/certs/client \
--volume jenkins-data:/var/jenkins_home \
--publish 2375:2375 \
docker:dind --storage-driver overlay2
