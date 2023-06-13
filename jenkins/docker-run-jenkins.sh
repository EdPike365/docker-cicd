docker run --name jenkins \
  --detach --restart=unless-stopped \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --env JENKINS_ADMIN_ID=myadmin --env JENKINS_ADMIN_PASSWORD=myadmin \
  --env SCM_USERNAME=$HOST_SCM_USERNAME \
  --env SCM_TOKEN=$HOST_SCM_TOKEN \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins:2.387.3
