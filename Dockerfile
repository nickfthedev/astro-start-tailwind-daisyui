
# Use the official Node.js 21 as a parent image
FROM node:21-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and yarn.lock files into the working directory
COPY package.json yarn.lock ./

# Install Yarn globally
# RUN npm install -g yarn #Comes Preinstalled in Node 21

# Install any dependencies
RUN yarn install

# Copy the rest of your application's code
COPY . .

# Build your app
RUN yarn build

# The application listens on port 4321. Use the EXPOSE instruction to have it mapped by the docker daemon:
EXPOSE 3333

# Define an environment variable for the port to allow changing it in the future without modifying the Dockerfile
ENV PORT=3333
ENV HOST=0.0.0.0
# Command to run your app using Yarn
CMD ["yarn", "prod"]
