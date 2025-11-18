FROM alpine:3.22.2 AS build

RUN apk update && \
    apk add openjdk25-jdk \
        --no-cache \
        --repository=https://dl-cdn.alpinelinux.org/edge/community/

WORKDIR /build

COPY gradlew ./gradlew
COPY build.gradle ./build.gradle
COPY settings.gradle ./settings.gradle
COPY gradle ./gradle

RUN ./gradlew dependencies --refresh-dependencies

COPY src ./src

RUN ./gradlew build


FROM alpine:3.22.2 AS runtime

RUN apk update && \
    apk add openjdk25-jre \
        --no-cache \
        --repository=https://dl-cdn.alpinelinux.org/edge/community/

WORKDIR /app

COPY --from=build /build/build/libs/*.jar ./petclinic.jar

CMD ["java", "-jar", "petclinic.jar"]
