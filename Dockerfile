# Step 1: Build stage
FROM node:23-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN npm run build &&\
# Install only production dependencies
 npm prune --production

# Step 2: Production stage
FROM node:23-alpine

# Set working directory
WORKDIR /app

# Copy the built application and dependencies from the build stage
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public

# Expose port
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "start"]