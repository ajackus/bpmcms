FROM strapi/base

WORKDIR /strapi-app

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install

COPY . .


ENV DATABASE_CLIENT=postgres
ENV DATABASE_NAME=bpmcms
ENV DATABASE_HOST=devbpmcms.c2xxhknl9eot.ap-south-1.rds.amazonaws.com
ENV DATABASE_PORT=5432
ENV DATABASE_USERNAME=bpmuser
ENV DATABASE_PASSWORD=bpmuser123#$

ENV NODE_ENV development

RUN yarn build

EXPOSE 1337

ENTRYPOINT ["yarn", "start"]


