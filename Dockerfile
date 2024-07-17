FROM node:latest-alpine
WORKDIR /app
COPY package.json .
RUN npm install -g pnpm
RUN pnpm install
RUN pnpm i -g serve
COPY . .
RUN pnpm run build
EXPOSE 3000
CMD [ "serve", "-s", "dist" ]