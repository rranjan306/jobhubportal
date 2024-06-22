# Step 1: Build the Angular application
FROM node:18 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Step 2: Serve the app with NGINX
FROM nginx:alpine

# Copy the build output to replace the default nginx contents.
RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /app/dist/angular-refresher /usr/share/nginx/html
COPY nginx.conf  /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
