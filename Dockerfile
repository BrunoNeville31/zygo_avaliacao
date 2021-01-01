FROM ruby:2.6.6-slim-stretch

WORKDIR /bookshelf

COPY Gemfile /bookshelf/Gemfile
COPY Gemfile.lock /bookshelf/Gemfile.lock

RUN apt-get update -qq && apt-get install -y locales && update-locale LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Basic tools
RUN apt-get install -qq -y --no-install-recommends \
		apt-utils build-essential libpq-dev curl apt-transport-https \
		libsqlite3-dev git

# Node and Yarn setup
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
		curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
		echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get install -qq -y --no-install-recommends nodejs && \
		npm install --global yarn \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 2.1.4 && bundle _2.1.4_ install

RUN yarn install --check-files && yarn global add eslint