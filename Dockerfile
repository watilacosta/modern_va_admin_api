FROM ruby:3.3.4-slim-bullseye

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential default-libmysqlclient-dev git libvips pkg-config

ENV BUNDLER_VERSION=2.5.6
ENV ELASTICSEARCH_URL=http://opensearch:9200

WORKDIR /home/app
COPY Gemfile /home/app/Gemfile
COPY Gemfile.lock /home/app/Gemfile.lock

RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle install

RUN chown -R $USER:$USER .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]