Usage:
------

    docker-compose up -d

    curl https://localhost:5000/v1/_ping --insecure

    # username: xyz, password: xyz
    docker login -u <username> -p <password> -e <email> localhost:5000
    docker pull hello-world
    docker tag hello-world:latest localhost:5000/hello-secure-world:latest
    docker push localhost:5000/hello-secure-world:latest

generate your own certificate:

    ./certs/gen.sh

generate your htpasswd

    htpasswd -cB auth/htpasswd exampleuser

Issues:
-------

### remote error: bad certificate

on client

- sudo cp certs/domain.crt /etc/docker/certs.d/myregistrydomain.com/ca.crt
- add --insecure-registry myregistrydomain.com to DOCKER_OPTS in /etc/default/docker

restart docker daemon

References:
-----------

- https://docs.docker.com/registry/deploying/
- http://tech.paulcz.net/2016/01/deploying-a-secure-docker-registry/
- http://container-solutions.com/running-secured-docker-registry-2-0/
- https://github.com/ContainerSolutions/docker-registry-proxy
- https://daviddaeschler.com/2016/01/18/docker-registry-auth-issues/
