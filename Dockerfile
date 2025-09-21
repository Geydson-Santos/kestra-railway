# Minimal image from Kestra
FROM kestra/kestra:latest

# Put your config in the image (or mount via env var below)
COPY config.yml /app/config.yml

# Default command can be overridden per Railway service
CMD ["server", "standalone", "-c", "/app/config.yml"]
