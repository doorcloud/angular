FROM node:20-alpine AS build

WORKDIR /usr/src/app

COPY package*.json  ./

RUN npm install --force
COPY . .
RUN npm run build



FROM nginx:1.21
COPY --from=build /usr/src/app/dist/cloudoorlp /usr/share/nginx/html
COPY nginx.conf  /etc/nginx/conf.d/default.conf

EXPOSE 80