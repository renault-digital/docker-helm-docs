FROM alpine:3

# variable "VERSION" must be passed as docker environment variables during the image build
# docker build --no-cache --build-arg VERSION=2.12.0 -t alpine/helm:2.12.0 .

ARG VERSION
ARG NO_PREFIX_VERSION

# https://github.com/norwoodj/helm-docs/releases/download/v0.13.0/helm-docs_0.13.0_Linux_i386.tar.gz
ENV BASE_URL="https://github.com/norwoodj/helm-docs/releases/download"
ENV TAR_FILE="${VERSION}/helm-docs_${NO_PREFIX_VERSION}_Linux_x86_64.tar.gz"

RUN apk add --update --no-cache curl ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} | tar xvz && \
    mv helm-docs /usr/bin/helm-docs && \
    chmod +x /usr/bin/helm-docs && \
    rm -f /var/cache/apk/*

WORKDIR /apps

ENTRYPOINT ["helm-docs"]
CMD ["--help"]
