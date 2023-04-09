FROM node:16

WORKDIR /usr/src/app

ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL

COPY . .

# Change npm ci to npm install since we are going to be in development mode
RUN npm install

# npm start is the command to start the application in development mode
CMD [ "npm", "run", "start" ]