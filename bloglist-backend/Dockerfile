FROM node:latest

RUN apt-get update && apt-get install -y --no-install-recommends dumb-init

ARG MONGODB_URI
ARG SECRET

ENV MONGODB_URI=$MONGODB_URI
ENV SECRET=$SECRET

ENV NODE_ENV production

WORKDIR /usr/src/app

COPY --chown=node:node . .

RUN npm ci --only=production

USER node
CMD npm run start