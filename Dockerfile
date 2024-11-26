# Use a lightweight Node image
FROM node:14-alpine

# Set working directory in the container
WORKDIR /build

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy application code
COPY . .

# Build the React app
RUN npm run build

# Expose port 80
EXPOSE 80

# Start the application
CMD ["npm", "start"]
