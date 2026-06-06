# #Base Image
# FROM node:20

# # Metadata (optional)
# LABEL author="Abhishek"

# # Set working directory
# WORKDIR /app

# # Copy files
# COPY package.json .
# COPY package-lock.json .

# # Install dependencies
# RUN npm install

# # Copy remaining files
# COPY . .

# # Expose port
# EXPOSE 5173

# # Environment variable
# ENV NODE_ENV=production

# # Default command
# CMD ["npm", "run","dev"]


FROM node:20

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

RUN npm install -g serve

EXPOSE 5173

CMD ["serve", "-s", "dist", "-l", "5173"]