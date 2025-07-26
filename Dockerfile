# base image
FROM node:22

# set working directory
WORKDIR /app

# copy package files and install deps
COPY package*.json ./
RUN npm install

# copy everything else
COPY . .

# build TypeScript to JavaScript
RUN npm run build

# generate prisma client
RUN npx prisma generate

# migrate (if needed)
RUN npx prisma migrate deploy || true

# start in prod mode
CMD ["npm", "run", "start:prod"]
