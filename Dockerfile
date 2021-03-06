FROM node:14.16.0-alpine AS builder
COPY . ./angularWithDocker
WORKDIR /angularWithDocker
RUN npm i
RUN $(npm bin)/ng build --prod

FROM nginx:1.15.8-alpine
COPY --from=builder /angularWithDocker/dist/angularWithDocker/ /usr/share/nginx/html