FROM node:latest

ENV DB_USER=root
ENV DB_PASS=password
ENV DB_HOST=localhost
ENV DB_NAME=oss_db
ENV DB_PORT=3306
ENV SERVER_HOST=localhost
ENV SERVER_PORT=3000
ENV JWT_SECRET=MYSECRET

COPY ./ ./

RUN npm install

CMD ["npm", "start"]