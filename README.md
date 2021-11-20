### Prerequisite :

- Node installed in system
- Docker installed in system

### Create an empty folder and run following commands :

> `npm init
npm i express`
> 

This will initialize your node app and install express as dependency. Or clone [this](https://github.com/9jaydoshi9/node-express-docker-setup) repo:

### Create ***index.js*** and paste below code for express boiler plate.

```jsx
const express = require('express')
const app = express()
const port = 3001

app.get('/', (req, res) => {
  res.send('A basic hello world for docker setup with node.')
})

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`)
})
```

### Run following command and got to [http://localhost:3001/](http://localhost:3001/) to check its working.

> `npm start`
> 

### Create ***Dockerfile*** and paste below code . Check [this](https://github.com/9jaydoshi9/node-express-docker-setup) repo:

```docker
# To take base image of node from docker hub
FROM node:14-alpine
# To set our default working directory as /app
WORKDIR /app
# To copy from source-destination(/app)
COPY package.json .
# To executes commands on top of our current image
RUN npm install
# Copy all files to /app
COPY . ./
# Informs docker that container listens on ports at runtime (does not actually publish the port)
EXPOSE 3001
# There can only be one CMD instruction in a Dockerfile
CMD [ "node" , "index.js" ]
```

### Check if docker is installed and running in the system.

> `docker version`
> 

Gives following output :

<aside>
💡 `Client:
Cloud integration: 1.0.17
Version:           20.10.8
API version:       1.41
Go version:        go1.16.6
Git commit:        3967b7d
Built:             Fri Jul 30 19:58:50 2021
OS/Arch:           windows/amd64
Context:           default
Experimental:      true`

</aside>

### To build a docker image :

> `docker build -t node-docker-setup-image .`
> 

### To list all images :

> `docker image ls`
> 

Shows following details for all images :

```jsx
REPOSITORY                TAG       IMAGE ID       CREATED          SIZE
node-docker-setup-image   latest    0b07a5fab186   59 minutes ago   121MB
```

### To run a docker image as a container :

> `docker run -p 3001:3001 -d --name node-docker-setup node-docker-setup-image`
> 

### To check all running docker containers :

> `docker ps`
> 

Shows following details for all containers :

```jsx
CONTAINER ID   IMAGE                     COMMAND                  CREATED              STATUS              PORTS                    NAMES
14498c82785e   node-docker-setup-image   "docker-entrypoint.s…"   About a minute ago   Up About a minute   0.0.0.0:3001->3001/tcp   node-docker-setup
```

### To go into our docker container and see files :

> `docker exec -it node-docker-setup /bin/sh`
> 

here ***'/bin/sh'*** is used for windows OS , you can use ***'bash'*** instead. 

We will see following in cli and interact with it :

```jsx
/app # ls
Dockerfile         index.js           node_modules       package-lock.json  package.json
/app # exit
```

### Delete an D**ocker image** :

> `docker image rm 0b07a5fab186`
> 

### Delete an D**ocker container**:

> `docker rm node-docker-setup -f`
>