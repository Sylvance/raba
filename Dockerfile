# syntax=docker/dockerfile:1

FROM ruby:3.0.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /usr/src/raba

COPY Gemfile /usr/src/raba/Gemfile

COPY Gemfile.lock /usr/src/raba/Gemfile.lock

RUN bundle install

COPY bin/entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD [ "server"]
