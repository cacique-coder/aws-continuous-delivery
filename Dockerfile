FROM ruby:2.6.2-alpine
# Alpine version 3.9 Arch: x86_64
#https://pkgs.alpinelinux.org/packages?branch=v3.9&arch=x86_64

RUN apk update && apk add --no-cache build-base postgresql-dev tzdata git postgresql-client
RUN mkdir /signature
WORKDIR /signature

COPY Gemfile* ./

RUN gem update --system
RUN bundle install --jobs 4

EXPOSE 4567
COPY . .
