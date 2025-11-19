target "default" {
    context = "."
    dockerfile = "docker/Dockerfile"
    tags = ["petclinic:latest"]
    args = {
        ALPINE_PACKAGE_BRANCH_REPO = "${ALPINE_PACKAGE_BRANCH}/${ALPINE_PACKAGE_REPO}"
        ALPINE_VERSION = "${ALPINE_VERSION}"
        JAVA_VERSION = "${JAVA_VERSION}"
    }
}
