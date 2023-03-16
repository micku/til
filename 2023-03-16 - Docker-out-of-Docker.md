2023-03-16

# Docker-out-of-Docker

There are ways to interact with Docker within a Docker container. Initially, it was described how to run Docker-in-Docker, and was soon [discouraged](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/) by the same person that started talking about that practice.

The primary use for this practice was in CI pipelines, 