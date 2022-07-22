# syntax=docker/dockerfile:1

FROM ruby:3.0.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/Gemfile

COPY Gemfile.lock /usr/src/app/Gemfile.lock

RUN bundle install

COPY bin/entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
