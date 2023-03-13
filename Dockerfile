FROM openjdk:11-jdk-slim

ARG JAR_FILE=myapp/target/myapp-1.0.0.jar
COPY ${JAR_FILE} app.jar

RUN useradd -u 1001 nonroot && chown nonroot /app
USER nonroot

ENTRYPOINT ["java","-jar","/app.jar"]
