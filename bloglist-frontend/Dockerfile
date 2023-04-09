FROM node:latest AS build-stage
WORKDIR /usr/src/app
ARG REACT_APP_BACKEND_URL
ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL
COPY . .
RUN npm ci
RUN npm run build
RUN npm install -g serve
CMD ["serve", "-s" "build"]

FROM build-stage as test-stage
ARG REACT_APP_BACKEND_URL
ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL
COPY . .
RUN npm ci
RUN CI=true npm test

FROM nginx:latest as nginx-stage
COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html