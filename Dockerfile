FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build <---- all staff we built

FROM nginx:1.7.9
COPY --from=builder /app/build /usr/share/nginx/html


