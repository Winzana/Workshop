FROM node:14.17-alpine as node_build

RUN apk add --update --no-cache --repository https://alpine.global.ssl.fastly.net/alpine/v3.10/community/ --repository http://dl-3.alpinelinux.org/alpine/v3.10/main vips-dev gcc g++ clang make python3 git curl netcat-openbsd \
    --repository https://alpine.global.ssl.fastly.net/alpine/v3.10/community/ \
    && rm -rf /var/cache/apk/* && \
    npm config set python /usr/bin/python2 && \
    npm install -g node-gyp

# Create and change to the app directory.
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -ci

COPY ./apps ./apps
COPY ./libs ./libs
COPY ./tools ./tools
COPY ./workspace.json ./workspace.json
COPY ./nx.json ./nx.json
COPY ./tsconfig.base.json ./tsconfig.base.json


####################################
# analytics
####################################
FROM node_build as node_build_source

ARG BUILD_BIN

RUN npm run nx build ${BUILD_BIN} --configuration production

FROM node:14.17-alpine as node_dist

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy local code to the container image.
COPY --from=node_build_source --chown=node:node /usr/src/app/package.json ./package.json
COPY --from=node_build_source --chown=node:node /usr/src/app/node_modules ./node_modules
COPY --from=node_build_source --chown=node:node /usr/src/app/dist ./dist
