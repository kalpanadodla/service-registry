FROM openjdk
EXPOSE 80
COPY ["target/cloud-config-server-0.0.1-SNAPSHOT.jar", "cloud-config-server.jar"]
ENTRYPOINT ["java","-jar","/cloud-config-server.jar"]