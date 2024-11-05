FROM mhart/alpine-node:12
COPY . /app
CMD node /app/app.js
EXPOSE 3000