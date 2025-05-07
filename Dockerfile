# Use official Node.js base image
FROM node:14

# Set working directory:Copy all files:Install app dependencies
WORKDIR /app
COPY . .
RUN npm install


# Expose port 3000 and run the server.
EXPOSE 3000
CMD ["node", "server.js"]
