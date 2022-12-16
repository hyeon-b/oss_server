FROM bitnami/node:16.19.0
COPY . /app
WORKDIR /app


ENV DB_USER="root"
ENV DB_PASS="password"
ENV DB_HOST=127.0.0.1
ENV DB_NAME="oss_db"
ENV DB_PORT=3306
ENV SERVER_HOST=localhost
ENV SERVER_PORT=3000
ENV JWT_SECRET=MYSECRET

RUN npm install

CMD ["npm", "start"]