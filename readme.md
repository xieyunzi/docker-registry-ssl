http://container-solutions.com/running-secured-docker-registry-2-0/
https://github.com/ContainerSolutions/docker-registry-proxy

usage:

    curl https://localhost:11443/v1/_ping --insecure

    # username: xyz, password: xyz
    docker login -u <username> -p <password> -e <email> localhost:443
    docker pull hello-world
    docker tag hello-world:latest localhost:443/hello-secure-world:latest
    docker push localhost:443/hello-secure-world:latest
