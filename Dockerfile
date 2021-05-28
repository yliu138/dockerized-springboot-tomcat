FROM maven:3.8.1 as maven
LABEL AUTHOR="Leo Liu"

# Build the war file
WORKDIR /usr/src/app
COPY . .
RUN mvn clean package

FROM tomcat:10.0.6-jdk11-openjdk
ARG TOMCAT_FILE_PATH=/docker

#Data & Config - Persistent Mount Point
ENV APP_DATA_FOLDER=/var/lib/DockerizedSpringBoot
ENV SAMPLE_APP_CONFIG=${APP_DATA_FOLDER}/config/
	
ENV CATALINA_OPTS="-Xms1024m -Xmx4096m -XX:MetaspaceSize=512m -	XX:MaxMetaspaceSize=512m -Xss512k"

# Move the war file to the tomcat docker container
WORKDIR /usr/local/tomcat/webapps
COPY --from=maven /usr/src/app/target/DockerizedSpringBoot.war dockerized-spring-boot.war

EXPOSE 8080
CMD ["catalina.sh", "run"]