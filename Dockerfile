FROM node:20-alpine AS build

WORKDIR /usr/src/app

COPY package*.json  ./

RUN npm install --force
COPY . .
RUN npm run build



FROM nginx:1.21
COPY --from=build /usr/src/app/dist/angular /usr/share/nginx/html
#COPY nginx.conf  /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
