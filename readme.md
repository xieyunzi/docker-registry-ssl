Usage:
------

    docker-compose up -d

    curl https://localhost:11443/v1/_ping --insecure

    # username: xyz, password: xyz
    docker login -u <username> -p <password> -e <email> localhost:443
    docker pull hello-world
    docker tag hello-world:latest localhost:443/hello-secure-world:latest
    docker push localhost:443/hello-secure-world:latest

generate your own certificate:

    openssl genrsa 2048 -out certs/docker-registry.key
    chmod 400 certs/docker-registry.key
    openssl req -new -x509 -nodes -sha1 -days 365 -key certs/docker-registry.key -out certs/docker-registry.crt

generate your htpasswd

    htpasswd -c htpasswd exampleuser

References:
------

- http://container-solutions.com/running-secured-docker-registry-2-0/
- https://github.com/ContainerSolutions/docker-registry-proxy
