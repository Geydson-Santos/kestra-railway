# Use the official Kestra image (multi-arch; pin if you want)
ARG IMAGE_TAG=latest
FROM kestra/kestra:${IMAGE_TAG}

WORKDIR /app
RUN mkdir -p /app/config /app/flows

# If you keep a config file:
COPY application.yaml /app/config/application.yaml
# (flows/ is optional; remove if you don’t want seed flows)
# COPY flows /app/flows

EXPOSE 8080 8081
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=5 \
  CMD wget -qO- http://127.0.0.1:8081/health/readiness || exit 1

CMD ["kestra", "server", "standalone", "--config", "/app/config/application.yaml"]
