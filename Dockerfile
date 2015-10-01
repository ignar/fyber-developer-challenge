FROM ruby:2.2.0
MAINTAINER artem.melnikov@ignar.name

RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /app

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app
WORKDIR /app
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace

EXPOSE 3000
CMD ["rails","server","-b","0.0.0.0","-e","production","-p","3000"]