# Use the official Node.js 18 image as the base image
FROM node:22

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install all dependencies (including dev dependencies for testing)
RUN npm install --legacy-peer-deps

# Copy the rest of the application source code
COPY . .

# Run tests to make sure the app works correctly
#RUN npm run test

# Build the Next.js application
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Set the command to start the Next.js application
CMD ["npm", "run", "start"]
