# KAFKA WEB UI Docker image

Project page: https://github.com/claudemamo/kafka-web-console

## Purpose

Provides the kafka ui console in a docker image

## Details

The kafka web console is using the play! framework.
To make it work in docker, it's necessary to build a standalone version, otherwise the
docker containers finishes abruptly after the server has started, or requires a TTY.


