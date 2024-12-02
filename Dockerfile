ARG PG_VERSION=15-debian-12
FROM bitnami/postgresql:${PG_VERSION}

ARG PG_SERVER_VERSION=15

USER root

RUN set -eux && sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y --no-install-recommends build-essential postgresql-server-dev-${PG_SERVER_VERSION} make flex bison pgxnclient && \
  pgxn install ApacheAge && \
  pgxn install vector && \
  rm -rf /var/lib/apt/lists/*
