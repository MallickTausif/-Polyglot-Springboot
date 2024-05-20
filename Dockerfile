FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/_Pyglot_-0.0.1-SNAPSHOT.jar _Pyglot_.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","_Pyglot_.jar"]