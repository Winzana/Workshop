FROM node:14-alpine as node_build
# Create and change to the app directory.
WORKDIR /usr/src/app
RUN apk add --update --no-cache git
COPY package*.json ./

RUN npm install

COPY ./apps ./apps
COPY ./libs ./libs
COPY ./tools ./tools
COPY ./workspace.json ./workspace.json
COPY ./nx.json ./nx.json
COPY ./tsconfig.base.json ./tsconfig.base.json
COPY ./babel.config.json ./babel.config.json

####################################
# workspace Dashboard
####################################
FROM node_build as node_build_workspace
ARG APP_ENV=production
RUN yarn nx build website --configuration=$APP_ENV --memoryLimit 6144

FROM nginx:alpine as workspace
COPY docker/website/default.conf /etc/nginx/conf.d/default.conf
COPY docker/website/nginx.conf /etc/nginx/nginx.conf
COPY --from=node_build_workspace /usr/src/app/dist/apps/website/ /usr/share/nginx/html/
