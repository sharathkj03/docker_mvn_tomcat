FROM maven:3.8.2-openjdk-8 as build_stage
WORKDIR /maven
COPY . .
RUN mvn clean package

FROM tomcat:9.0
COPY --from=build_stage /maven/target/hello-world-war-1.0.0.war /usr/local/tomcat/webapps/
