FROM node:latest AS build

WORKDIR /io.hinman.ben
COPY package-lock.json package.json ./
RUN npm install
COPY index.html tailwind.config.js tailwind.css ./
RUN npm run tailwindcss-build

FROM nginx:alpine

COPY --from=build /io.hinman.ben/index.html /io.hinman.ben/site.css /usr/share/nginx/html/
EXPOSE 80
