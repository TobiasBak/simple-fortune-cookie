#!/bin/bash
echo "$docker_password" | docker login --username "$docker_username" --password-stdin ghcr.io

docker_username_lower=$(echo "$docker_username" | tr '[:upper:]' '[:lower:]')
docker_username=$docker_username_lower

export backendVersion="ghcr.io/$docker_username/fortune-cookie/backend:$VERSION_TAG" 
export backendLatest="ghcr.io/$docker_username/fortune-cookie/backend:latest" 

export frontendVersion="ghcr.io/$docker_username/fortune-cookie/frontend:$VERSION_TAG"   
export frontendLatest="ghcr.io/$docker_username/fortune-cookie/frontend:latest" 


docker push $backendVersion

docker tag $backendVersion $backendLatest

docker push $backendLatest

docker push $backendVersion-debug
# Backend pushed


docker push $frontendVersion

docker tag $frontendVersion $frontendLatest

docker push $frontendLatest  

docker push $frontendVersion-debug &
wait
