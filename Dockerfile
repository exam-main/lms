# Dockerfile

FROM node:22

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npx prisma generate
RUN npx prisma migrate deploy || true
RUN npm run build

CMD ["npm", "run", "start:prod"]
