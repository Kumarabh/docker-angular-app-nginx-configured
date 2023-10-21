# Stage 1: Compile and Build angular codebase
FROM node:18.18.2 as build
WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm install
RUN npm run build

# Stage 2: Serve app with nginx server
FROM nginx:latest
COPY --from=build /usr/local/app/dist/appdemo usr/share/nginx/html
COPY /nginx.conf  /etc/nginx/conf.d/default.conf
EXPOSE 80

# build app:- docker build -t angular-app-image .
# run app:-  docker run -d --name=angular-app-container -p 80:80 2bf4fe518bf2
# enter container:- docker exec -it angular-app-container sh
