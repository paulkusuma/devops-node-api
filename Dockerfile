# Gunakan Node resmi
FROM node:18-alpine

# Set working directory di dalam container
WORKDIR /app

# Copy package.json & package-lock.json dulu
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy semua file project
COPY . .

# Expose port untuk container
EXPOSE 3000

# Start Node.js
CMD ["npm", "start"]

