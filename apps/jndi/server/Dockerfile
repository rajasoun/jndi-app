FROM maven AS build
ADD . /jndi-exploit
WORKDIR /jndi-exploit
RUN mvn clean compile assembly:single

FROM gcr.io/distroless/java:11
COPY --from=build /jndi-exploit/target/jndi-exploit-1.0-SNAPSHOT-jar-with-dependencies.jar /jndi-exploit.jar

EXPOSE 8888
EXPOSE 1389

ENTRYPOINT ["java", "-jar", "/jndi-exploit.jar","--hostname","jndi.sec-tools.link"]
