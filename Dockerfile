FROM ruby:2.3.1-slim

LABEL Name=lovely-project REPOSITORY=lovely-project TAG=2.5-slim  Version=0.0.1 MAINTAINER=toandepzai_k0_aj_sAnh_BaNg@zinza.com
EXPOSE 3000

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir /lovely-project

WORKDIR /lovely-project
COPY Gemfile /lovely-project/Gemfile
COPY Gemfile.lock /lovely-project/Gemfile.lock
RUN bundle install
COPY . /lovely-project

CMD ["bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0"]