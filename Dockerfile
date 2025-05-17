# Stage 1: Build the frontend application
FROM node:18-alpine AS build-stage

# Set working directory
WORKDIR /usr/src/app

# Accept build arguments (these will be passed via --build-arg)
ARG VITE_CLERK_PUBLISHABLE_KEY
ARG VITE_API_BASE_URL

# Set environment variables for Vite build (also make them available in build)
ENV VITE_CLERK_PUBLISHABLE_KEY=${VITE_CLERK_PUBLISHABLE_KEY}
ENV VITE_API_BASE_URL=${VITE_API_BASE_URL}

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production=false

# Copy all source files
COPY . .

# Build the frontend application
RUN VITE_CLERK_PUBLISHABLE_KEY=${VITE_CLERK_PUBLISHABLE_KEY} \
    VITE_API_BASE_URL=${VITE_API_BASE_URL} \
    npm run build
