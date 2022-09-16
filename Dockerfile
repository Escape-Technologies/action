FROM node:18-alpine

WORKDIR /app

RUN npm install -g @escape.tech/action

CMD ["escape-action"]
