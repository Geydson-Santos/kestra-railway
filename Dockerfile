# Use the official Kestra image (multi-arch; pin if you want)
ARG IMAGE_TAG=latest
FROM kestra/kestra:${IMAGE_TAG}

# Make a place for config and flows
WORKDIR /app
RUN mkdir -p /etc/kestra /app/flows

# Copy config & example flows
COPY application.yaml /etc/kestra/application.yaml
COPY flows /app/flows

# Expose UI (8080) and monitoring (8081)
EXPOSE 8080 8081

# Healthcheck hits Micronaut health on monitoring port
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=5 \
  CMD wget -qO- http://127.0.0.1:8081/health/readiness || exit 1

# Start in standalone mode with our config
CMD ["kestra", "server", "standalone", "--config", "/etc/kestra/application.yaml"]
