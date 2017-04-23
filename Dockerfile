# First stage to build the application
FROM maven:3.5.0-jdk-8-alpine AS build-env
ADD ./pom.xml pom.xml
ADD ./src src/
RUN mvn clean package

# Final stage to define our minimal runtime
FROM tutum/tomcat
COPY --from=build-env target/app.war tomcat/webapps/app.war
