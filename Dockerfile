#use latest version available on docker hub
FROM node:18
#Create the dir
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE  3000
CMD [ "node", "app.js" ]