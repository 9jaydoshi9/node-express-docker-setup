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