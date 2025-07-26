# 1. Node imageni tanlaymiz
FROM node:22-alpine

# 2. Ishchi papka
WORKDIR /app

# 3. package*.json fayllarini ko‘chirish
COPY package*.json ./

# 4. Modul o‘rnatish
RUN npm install

# 5. Barcha fayllarni nusxalash
COPY . .

# 6. NestJS ni build qilish (dist/ ni yaratadi)
RUN npm run build

# 7. Portni ochish
EXPOSE 3000

# 8. Appni ishga tushirish
CMD ["npm", "run", "start:prod"]
