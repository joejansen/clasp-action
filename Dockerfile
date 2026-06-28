FROM node:20-alpine

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update npm

RUN npm install -g @google/clasp@2.5.0

ENTRYPOINT ["/entrypoint.sh"]
