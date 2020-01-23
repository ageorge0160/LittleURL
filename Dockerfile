FROM ruby:2.4
LABEL maintainer="https://github.com/ageorge0160"

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
apt-transport-https

RUN curl -sS https://deb.nodesource.com/setup_8.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
nodejs \
yarn


COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
