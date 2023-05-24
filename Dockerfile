ARG BASE_IMAGE
ARG VERSION


# sphinxdoc/sphinx - base: python3:slim - base: debian:11
#  see: https://github.com/sphinx-doc/sphinx-docker-images/blob/master/base/Dockerfile
# sphinxdoc/sphinx-latexpdf
FROM ${BASE_IMAGE}:${VERSION}

LABEL org.opencontainers.image.authors = "hedzr <hedzr@duck.com>"
LABEL org.opencontainers.image.documentation = "https://github.com/${REPO_NAME}"
LABEL org.opencontainers.image.source = "https://github.com/${REPO_NAME}"
LABEL org.opencontainers.image.version = "${VERSION}"
LABEL org.opencontainers.image.licenses = "Apache 2.0"
LABEL org.opencontainers.image.description = "make sphinx building easier with ${REPO_NAME}"
LABEL com.hedzr.image.authors="hedzr <hedzr@duck.com>"
LABEL com.hedzr.image.description="make sphinx building easier with ${REPO_NAME}"
LABEL description="make sphinx building easier with ${REPO_NAME}"
LABEL version="${VERSION}"

WORKDIR /docs
COPY requirements.txt /docs

ARG REPO_NAME="hedzr/sphinx-docker"
ARG APT_MIRROR
# ARG APT_ORIGIN="archive.ubuntu.com"
ARG APT_ORIGIN="deb.debian.org"
ARG PY_MIRROR

ENV mirror_site="${APT_MIRROR:-${APT_ORIGIN}}" \
    DEBIAN_FRONTEND=noninteractive \
    TZ=Etc/UTC \
    LOCALE=en_US.UTF-8

# sed -i "s@//.*archive.ubuntu.com@//${mirror_site}@g" /etc/apt/sources.list;
# sed -i "s@//.*deb.debian.org@//${mirror_site}@g" /etc/apt/sources.list;
RUN echo "APT_MIRROR: '${APT_MIRROR}' / '${mirror_site}'"; \
    if [ "${APT_MIRROR}" != "" ]; then \
    if [ ! -f /etc/apt/sources.list.cn-mirror.bak ]; then \
    cp /etc/apt/sources.list{,.cn-mirror.bak}; \
    sed -i "s@//.*${APT_ORIGIN}@//${mirror_site}@g" /etc/apt/sources.list; \
    rm -rf /var/lib/apt/lists/* && echo disable 'Hash Sum mismatch'; \
    apt-get update; \
    fi; else apt-get update; fi


# for debian: zlib1g-dev libjpeg-dev musl-dev linux-headers-amd64
# for ubuntu: zlib-dev jpeg-dev musl-dev linux-headers
RUN buildDeps="curl wget build-essential make \
    python3-dev zlib1g-dev libjpeg-dev musl-dev linux-headers-amd64"; \
    fetchDeps=" \
    python3 python3-pip \
    "; apt-get install -y --no-install-recommends $fetchDeps \
    && apt-get install -y --no-install-recommends $buildDeps \
    && echo "Current TimeZone updated: $(locale -a)" && date +'%z' \
    && echo \
    && echo \
    && if [ "${PY_MIRROR}" != "" ]; then \
    python3 -m pip config set global.index-url https://${PY_MIRROR}/simple/; \
    fi \
    && pip3 install -r requirements.txt \
    && echo \
    && echo \
    && echo \
    && apt-get purge -y --allow-remove-essential $buildDeps \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*; \
    echo \
    && echo \
    && pip3 list

# RUN pip3 install -r requirements.txt && echo && echo && pip3 list
