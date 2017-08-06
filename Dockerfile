FROM ruby:latest

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# for postgres
#RUN apt-get install -y 

# for nokogiri
#RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
#RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
#RUN apt-get install -y nodejs
#RUN apt-get install -y nodejs-legacy

RUN mkdir /blog
WORKDIR /blog
ADD Gemfile* /blog
RUN bundle install

ADD . /blog
