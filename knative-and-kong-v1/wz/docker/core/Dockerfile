FROM node:14.17-alpine as node_core

RUN apk add --update --no-cache --repository https://alpine.global.ssl.fastly.net/alpine/v3.10/community/ --repository http://dl-3.alpinelinux.org/alpine/v3.10/main vips-dev gcc g++ clang make python3 git curl netcat-openbsd \
  --repository https://alpine.global.ssl.fastly.net/alpine/v3.10/community/ \
  && rm -rf /var/cache/apk/* && \
  npm config set python /usr/bin/python2 && \
  npm install -g node-gyp

RUN apk add git

RUN mkdir -p /home/node/app
RUN chown -R node:node /home/node/app

USER node
WORKDIR /home/node/app
COPY --chown=node:node ./package.json /home/node/app/package.json
RUN yarn install
COPY --chown=node:node ./tsconfig.base.json /home/node/app/tsconfig.base.json
COPY --chown=node:node ./nx.json /home/node/app/nx.json
COPY --chown=node:node ./angular.json /home/node/app/angular.json
COPY --chown=node:node ./fixtures /home/node/app/fixtures
COPY --chown=node:node ./apps /home/node/app/apps
COPY --chown=node:node ./libs /home/node/app/libs
RUN yarn run nx build core --prod
RUN rm -rf /home/node/app/src
COPY --chown=node:node ./.env.dist /home/node/app/.env
ENV NODE_ENV=production

CMD [ "node", "./dist/apps/core/main.js" ]
