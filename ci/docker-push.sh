#!/bin/bash
echo "$docker_password" | docker login ghcr.io --username "$docker_username" --password-stdin

export backendVersion="ghcr.io/$docker_username/fortune-cookie/backend:$VERSION_TAG" 
export backendLatest="ghcr.io/$docker_username/fortune-cookie/backend:latest" 

export frontendVersion="ghcr.io/$docker_username/fortune-cookie/frontend:$VERSION_TAG"   
export frontendLatest="ghcr.io/$docker_username/fortune-cookie/frontend:latest" 


docker push $backendVersion

docker tag $backendVersion $backendLatest

docker push $backendLatest
# Backend pushed


docker push $frontendVersion

docker tag $frontendVersion $frontendLatest

docker push $frontendLatest  &
wait