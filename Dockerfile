# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Define typescript config by copying ts*.json
COPY ts*.json ./

COPY set_env_prod.sh ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

# Bind the port that the image will run on
EXPOSE 8081

# Define the Docker image's behavior at runtime
CMD ["npm", "run", "prod"]
