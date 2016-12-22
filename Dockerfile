FROM debian:jessie
MAINTAINER notogawa <n.ohkawa@gmail.com>

env DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends curl=7.* ca-certificates=* \
 && apt-get install -y --no-install-recommends texlive-luatex texlive-lang-japanese lmodern texlive-xetex \
 && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN curl -Lo pandoc.deb 'https://github.com/jgm/pandoc/releases/download/1.19.1/pandoc-1.19.1-1-amd64.deb' \
 && echo 'cb31d29ee8a34aa2fed135c75dd99748ae814f3008d82b6cdb5fd35aec3e7c72  pandoc.deb' | sha256sum -c --strict - \
 && dpkg -i pandoc.deb \
 && rm pandoc.deb
