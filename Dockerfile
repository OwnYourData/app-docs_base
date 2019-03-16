FROM ruby:2.5.3
MAINTAINER "Christoph Fabianek" christoph@ownyourdata.eu

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV RAILS_ROOT $WORKDIR
RUN mkdir -p $RAILS_ROOT/tmp/pids
COPY Gemfile /usr/src/app/

RUN bundle install && \
	bundle update && \
	gem install bundler

COPY . .

RUN bundle update && \
	rm -f tmp/pids/server.pid

CMD ["rails", "server", "-b", "0.0.0.0"]

EXPOSE 3000
