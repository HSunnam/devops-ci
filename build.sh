#!/bin/bash
docker build -t hsunnam/dev-app:latest .

# Tag and push to dev
docker tag dev-app:latest hsunnam/dev:latest

docker push hsunnam/dev:latest