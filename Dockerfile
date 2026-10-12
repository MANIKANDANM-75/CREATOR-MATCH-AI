FROM node:22-alpine

WORKDIR /app
RUN apk add --no-cache ffmpeg
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

ENV PORT=3000
EXPOSE 3000
CMD ["npm", "run", "server"]
