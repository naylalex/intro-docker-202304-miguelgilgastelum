FROM maven:3.6.3-jdk-8 as back
WORKDIR /backend
COPY . . 
RUN mvn verify

FROM openjdk:8-jdk-alpine
WORKDIR /home/backend
COPY --from=back /backend/target ./target
EXPOSE 8080
RUN adduser -D user
USER user
CMD ["java", "-jar", "/home/backend/target/words.jar"]

