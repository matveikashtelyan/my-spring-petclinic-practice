variable "ALPINE_PACKAGE_BRANCH" {
    type = string
    default = "edge"
    description = "Alpine branch to use for package installation"
}

variable "ALPINE_PACKAGE_REPO" {
    type = string
    default = "community"
    description = "Alpine repository to use for package installation"
}

variable "ALPINE_VERSION" {
    type = string
    default = "3.22.2"
    description = "Tag of Alpine image to be used as a base image"
}

variable JAVA_VERSION {
    type = number
    default = 25
    description = "JDK version to use"
}