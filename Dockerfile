# Use a base image appropriate for your application, for example, Node.js
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

RUN git clone https://github.com/ioanat94/burgrrr.git

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install application dependencies
RUN npm install -g npm@8.1.2
RUN npm install
RUN mkdir pages


# Copy the rest of the application files to the container
COPY . .

# Expose the port that the app runs on (if applicable)
EXPOSE 3000

# Define the command to start your application
CMD ["npm", "run", "dev"]
