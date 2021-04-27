FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y nodejs mysql-client
RUN mkdir /converter
WORKDIR /converter
COPY Gemfile /converter/Gemfile
COPY Gemfile.lock /converter/Gemfile.lock
RUN bundle install
COPY . /converter

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]