FROM openjdk
EXPOSE 8761
ADD target/service-registry.jar /service-registry.jar
ENTRYPOINT ["java","-jar","/service-registry.jar"]