# Login to Docker Hub
docker login

# Tag and push to dev
docker tag hsunnam/dev-app:latest hsunnam/dev:latest
docker push hsunnam/dev:latest

# Tag and push to prod (replace with the private repo)
docker tag hsunnam/dev-app:latest hsunnam/prod:latest
docker push hsunnam/prod:latest
