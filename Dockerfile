FROM ruby:2.5.1
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /share
WORKDIR /share
COPY Gemfile /share/Gemfile
COPY Gemfile.lock /share/Gemfile.lock
RUN bundle install

COPY . /share