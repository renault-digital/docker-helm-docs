# kubernetes helm-docs

[![Build Status](https://travis-ci.com/renault-digital/docker-helm-docs.svg?token=ncotYzyGStjuDrTy46xs&branch=master)](https://travis-ci.com/renault-digital/docker-helm-docs)

Auto-trigger docker build for [kubernetes helm-docs](https://github.com/norwoodj/helm-docs) when new release is announced.

[![DockerHub Badge](http://dockeri.co/image/renaultdigital/helm-docs)](https://hub.docker.com/r/renaultdigital/helm-docs/)

## NOTES

The latest docker tag is the latest release version (https://github.com/helm-docs/helm-docs/releases/latest)

Please avoid to use `latest` tag for any production deployment. Tag with right version is the proper way, such as `renaultdigital/helm-docs:3.1.1`

### Github Repo

https://github.com/renault-digital/helm-docs

### Daily Travis CI build logs

https://travis-ci.org/renault-digital/helm-docs

### Docker image tags

https://hub.docker.com/r/renaultdigital/helm-docs/tags/

# Usage

    # mount current folders in container and generate README.md based on README.tmpl.md
    docker run --rm -v $PWD:/build -w /build jnorwood/helm-docs

    # Mount current folder in container and check if the generated doc is different from the REAME.md
    docker run --rm -v $PWD:/build -w /build jnorwood/helm-docs -d | diff README.md -

# Why we need it

Mostly it is used during CI/CD (continuous integration and continuous delivery) or as part of an automated build/deployment

# The Processes to build this image

* Enable Travis CI cronjob on this repo to run build daily on master branch
* Check if there are new tags/releases announced via Github REST API
* Match the exist docker image tags via Hub.docker.io REST API
* If not matched, build the image with release version and push to https://hub.docker.com/
* Get the latest version from https://github.com/norwoodj/helm-docs/releases/latest, pull the image with that version, tag as `renaultdigital/helm-docs:latest` and push to hub.docker.com

# Credits

- Borrowed from [docker-helm](https://github.com/renault-digital/docker-helm).
- Original works from https://github.com/alpine-docker/helm-docs.
