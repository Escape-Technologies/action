FROM node:18-alpine

WORKDIR /app

RUN npm install -g @escape.tech/action
RUN npm show @escape.tech/action version

CMD ["echo", "Hello World"]

# CMD ["escape-action"]
