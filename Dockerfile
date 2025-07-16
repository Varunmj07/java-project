FROM maven:3.8.6-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:9.0
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
