# Stage 1: Build the application using Maven
FROM maven:3.8.5-openjdk-17 AS build

# Copy the entire project into the container
COPY . /src

# Set the working directory
WORKDIR /src

# Run Maven to clean and package the application, skipping tests
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM openjdk:17.0.1-jdk-slim

# Copy the built JAR file from the Maven build stage into the runtime image
COPY --from=build /src/target/_Pyglot_-0.0.1-SNAPSHOT.jar /_Pyglot_.jar

# Expose port 8080
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/_Pyglot_.jar"]
