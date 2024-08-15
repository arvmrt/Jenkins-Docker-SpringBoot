FROM openjdk:21-jdk
COPY  target/*.jar SpringBootSample-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "SpringBootSample-0.0.1-SNAPSHOT.jar"]
