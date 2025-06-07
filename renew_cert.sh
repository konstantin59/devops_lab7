#!/bin/bash

CERT_DIR="./certs"
CONTAINER_NAME="nginx2025-443"
rm ${CERT_DIR}/*
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "${CERT_DIR}/privkey.pem" \
  -out "${CERT_DIR}/cert.pem" \
  -subj "/CN=localhost"

docker exec "$CONTAINER_NAME" nginx -s reload

