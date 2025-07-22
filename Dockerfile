FROM docker:20.10-dind

LABEL maintainer="RafikFarhad <rafikfarhad@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/RafikFarhad/push-to-gcr-github-action"
LABEL org.opencontainers.image.description="A docker image that can build and push to Google Artifact Registry using gcloud"
LABEL org.opencontainers.image.licenses=MIT

# Install required tools
RUN apk update && \
    apk add --no-cache bash curl python3 py3-crcmod git && \
    ln -sf python3 /usr/bin/python

# Install Google Cloud SDK
RUN curl -sSL https://sdk.cloud.google.com | bash > /dev/null && \
    mv ~/google-cloud-sdk /opt/google-cloud-sdk

ENV PATH="/opt/google-cloud-sdk/bin:$PATH"

# Add your custom entrypoint script
COPY entrypoint.bash /entrypoint.bash
RUN chmod +x /entrypoint.bash

ENTRYPOINT ["/entrypoint.bash"]