FROM node:22
WORKDIR /app
COPY package.json /app
RUN npm install && npm install pm2 -g
COPY . /app
EXPOSE 3000
RUN apt-get update && apt-get install -y ncat jq
COPY wait-for /
CMD pm2 start --no-daemon ./bin/www
