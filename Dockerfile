#create docker file & image with java version 17 web app & mutlistage build
#java backend
#react as frontend


# Stage 1: Build React frontend
FROM node:18  
WORKDIR /app
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

# Stage 2: Build Java backend
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY backend/ ./
RUN ./mvnw clean package
EXPOSE 8080

