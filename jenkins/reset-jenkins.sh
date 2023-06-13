#!/bin/bash
bash ./clean-jenkins.sh
docker build -t myjenkins:2.387.3 .
bash ./docker-run-jenkins.sh
