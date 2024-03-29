FROM node:16
WORKDIR /usr/src/app
COPY package.json .

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi
COPY . .
ENV PORT 5000
EXPOSE $PORT
CMD ["node", "index.js"]