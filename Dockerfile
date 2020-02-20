FROM jruby:9.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev &&  gem install bundler
RUN mkdir /project
COPY Gemfile Gemfile.lock /project/
WORKDIR /project
RUN bundle install
COPY . /project