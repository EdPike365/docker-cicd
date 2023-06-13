# Jenkins LTS as of 2023-05-03
FROM jenkins/jenkins:2.387.3

USER root

# Update and install modules, show Linux Standard Base info
RUN apt-get update && apt-get install -y lsb-release

# Setup access to docker hub
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Install the Docker community edition CLI
# During docker run, we specify DOCKER_HOST so Docker commands are executed on our DinD container.
RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY ./casc_configs /var/jenkins_home/casc_configs
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

