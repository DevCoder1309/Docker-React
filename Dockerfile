FROM node:16-alpine as builder

WORKDIR '/home/app'

COPY ./package.json ./
RUN npm install
COPY ./ ./

RUN npm run build

FROM nginx

EXPOSE 80

COPY --from=builder /home/app/build /usr/share/nginx/html