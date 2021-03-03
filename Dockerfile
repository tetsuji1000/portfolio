FROM ruby:2.6.5

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

RUN mkdir /portfolio
WORKDIR /portfolio

ADD ./Gemfile /portfolio/Gemfile
ADD ./Gemfile.lock /portfolio/Gemfile.lock

RUN gem install bundler
RUN bundle install
ADD . /portfolio