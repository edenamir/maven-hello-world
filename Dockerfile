FROM openjdk:11-jdk-slim

ARG JAR_FILE=myapp/target
COPY ${JAR_FILE} myapp-1.0.0.jar

USER root
RUN apt-get update && apt-get install -y sudo && \
    useradd -u 1001 nonroot && \
    chown nonroot /app && \
    usermod -aG sudo nonroot && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER nonroot
ENTRYPOINT ["java","-jar","/app.jar"]
