FROM openjdk:8
ADD target/myapp-1.0.0.jar my-maven-docker-project.jar
ENTRYPOINT ["java", "-jar","my-maven-docker-project.jar"]
EXPOSE 8080
