FROM alpine:3.22.2 AS build

RUN apk update && \
    apk add openjdk25-jdk=25.0.1_p8-r1 \
        --no-cache \
        --repository=https://dl-cdn.alpinelinux.org/edge/community/

WORKDIR /build

COPY gradlew ./gradlew
COPY build.gradle ./build.gradle
COPY settings.gradle ./settings.gradle
COPY gradle ./gradle

RUN ./gradlew dependencies --refresh-dependencies

COPY src ./src

RUN ./gradlew build -x test

FROM alpine:3.22.2 AS runtime

RUN apk update && \
    apk add openjdk25-jre=25.0.1_p8-r1 \
        --no-cache \
        --repository=https://dl-cdn.alpinelinux.org/edge/community/

WORKDIR /app

COPY --from=build /build/build/libs/*.jar ./petclinic.jar

EXPOSE 8080

CMD ["java", "-jar", "petclinic.jar"]

