ARG ALPINE_PACKAGE_BRANCH_REPO='edge/community'
ARG ALPINE_TAG='3.22.2'
ARG JAVA_VERSION='25'


FROM alpine:${ALPINE_TAG} AS build

ARG ALPINE_PACKAGE_BRANCH_REPO
ARG JAVA_VERSION

RUN apk update && \
    apk add openjdk${JAVA_VERSION}-jdk \
        --no-cache \
        --repository=https://dl-cdn.alpinelinux.org/${ALPINE_PACKAGE_BRANCH_REPO}

WORKDIR /build

COPY gradlew ./gradlew
COPY build.gradle ./build.gradle
COPY settings.gradle ./settings.gradle
COPY gradle ./gradle

RUN ./gradlew dependencies --refresh-dependencies

COPY src ./src

RUN ./gradlew build


FROM alpine:${ALPINE_TAG} AS runtime

ARG ALPINE_PACKAGE_BRANCH_REPO
ARG JAVA_VERSION

RUN apk update && \
    apk add openjdk${JAVA_VERSION}-jre \
        --no-cache \
        --repository=https://dl-cdn.alpinelinux.org/${ALPINE_PACKAGE_BRANCH_REPO}

WORKDIR /app

COPY --from=build /build/build/libs/*.jar ./petclinic.jar

CMD ["java", "-jar", "petclinic.jar"]
