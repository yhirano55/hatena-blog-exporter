FROM ruby:latest

ENV SCRIPT_ROOT /hatena-blog-exporter
RUN apt-get update && rm -rf /var/lib/apt/lists/*
RUN gem update --system && gem update bundler

WORKDIR ${SCRIPT_ROOT}

ADD Gemfile .
RUN bundle install -j4

ADD . ${SCRIPT_ROOT}
