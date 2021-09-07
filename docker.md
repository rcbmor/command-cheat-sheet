# Run
- run options
`docker run --rm -it --name <nm> -p 5000:80 -v ~/dev:/code alpine:34 /bin/bash`
- stop
`docker stop web`
- kill
`docker kill web`
- overlay network
`docker network create --subnet 10.1.0.0/24 --gateway 10.1.0.1 -d overlay mynet`
- list networks
`docker network ls`
- list running
`docker ps`
- delete all running
`docker rm -f $(docker ps -aq)`
- create a bash process inside
`docker exec -it web bash`
- print logs
`docker logs --tail 100 web`

# Build
- build the image from Dockerfile
`docker build -t myapp:1.0 .`
- list images
`docker images`
- delete image from local store
`docker rmi alpine:3.4`

# Ship
- pull image from registry
`docker pull alpine:3.4`
- retag
`docker tag alpine:3.4 myrepo/myalpine:3.4`
- login to registry
`docker login my.registry.com:8000`
- push image
`docker push myrepo/myalpine:3.4`
