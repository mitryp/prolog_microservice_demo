FROM node:20.11.1-alpine3.19

ENV HOST=localhost
ENV PORT=8000
ENV ADVICE_SERVICE_HOST=localhost
ENV ADVICE_SERVICE_PORT=8001

WORKDIR /app
COPY . /app

EXPOSE $PORT

RUN npm i -y

CMD [ "npm", "run", "start" ]
