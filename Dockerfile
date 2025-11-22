# Use official Node.js 18 image as base
FROM node:18

# Set working directory inside container
WORKDIR /app

# Copy package.json and package-lock.json (if exists)
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install

# Copy all app files
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["npm", "start"]

