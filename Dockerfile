FROM frolvlad/alpine-glibc
MAINTAINER juliuscanute@touchcapture.net

ENV HUGO_VERSION 0.53
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit

#Add base dependencies
##Update package index
RUN apk update
##Virtual package of build deps not required for runtime
RUN apk add --virtual build-deps curl py-pip
RUN apk add bash python
RUN pip install awscli
##Delete build deps that will not be used later
RUN apk --purge -v del build-deps
##Remove package index
RUN rm /var/cache/apk/*

#Download and install HUGO
RUN mkdir /usr/local/hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /usr/local/hugo/
RUN tar xzf /usr/local/hugo/${HUGO_BINARY}.tar.gz -C /usr/local/hugo/ \
	&& ln -s /usr/local/hugo/hugo /usr/local/bin/hugo \
	&& rm /usr/local/hugo/${HUGO_BINARY}.tar.gz

RUN mkdir /usr/share/website
WORKDIR /usr/share/website

