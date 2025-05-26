# Dockerfile for Next.js
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependencies definition
COPY basic-nextjs-app-main/package.json ./

# Install dependencies
RUN npm install

# Copy all files
COPY basic-nextjs-app-main .

# Build the Next.js app
RUN npm run build

# Expose the port (default Next.js uses 3000)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
