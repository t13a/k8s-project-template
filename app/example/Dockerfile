FROM node:alpine

WORKDIR /srv

COPY package.json package-lock.json ./

RUN npm ci

COPY index.html ./

USER node

CMD ["npm", "start"]
