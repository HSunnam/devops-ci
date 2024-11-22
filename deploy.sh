#!/bin/bash

# Pull the latest image
docker pull hsunnam/dev:latest

# Stop existing container if running
docker stop dev-app || true
docker rm dev-app || true

# Run new container
docker run -d --name dev-app -p 80:80 hsunnam/dev:latest
```