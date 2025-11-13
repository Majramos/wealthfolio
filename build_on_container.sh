#!/usr/bin/env bash


# build the image from *Containerfile*
podman build --format=docker -t wealthfolio-builder:latest .

# run the image and build the app from the container shell
podman run --rm -i --tty --volume ./:/app:Z localhost/wealthfolio-builder:latest

