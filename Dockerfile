# Force linux/amd64 to avoid exec format errors on Railway
FROM --platform=linux/amd64 kestra/kestra:latest-lts

# Expose the web UI port
EXPOSE 8080

# Default command runs Kestra standalone server
CMD ["server", "standalone"]
