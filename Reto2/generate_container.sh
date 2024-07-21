#!/bin/bash

docker build -t container_hackathon:latest .

docker rm -f containerHackathon

docker run -it --name containerHackathon -p 5000:5000 -p 22:22 -d container_hackathon:latest