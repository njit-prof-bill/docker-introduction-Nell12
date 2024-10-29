#Instructions to build and run the Docker container
# Use an official Node.js image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the src code to the container
COPY src/ ./src

# Ensure the logs directory is created inside the container
RUN mkdir -p /app/logs

# Expose port 3000
EXPOSE 3000

# Start the server from the src directory
CMD ["node", "src/server.js"]

#docker run -d -p 3000:3000 -v $(pwd)/logs:/app/logs simple-node-app
#-d: runs the container in detached mode
#Maps port 3000 from the container to port 3000 on your machine
#Mounts the logs directory from your machine into the container