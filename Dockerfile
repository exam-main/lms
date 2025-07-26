# 1. Boshlang‘ich image
FROM node:22-alpine

# 2. Ishchi katalog
WORKDIR /app

# 3. package*.json fayllarini ko‘chirib olish
COPY package*.json ./

# 4. Modul o‘rnatish
RUN npm install

# 5. Barcha fayllarni konteynerga nusxalash
COPY . .

# 6. NestJS build (TypeScript -> JavaScript)
RUN npm run build

# 7. Port ochish
EXPOSE 3000 

# 8. App'ni ishga tushirish
CMD ["npm", "run", "start:prod"]
