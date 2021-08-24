FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# kaguzと書かれている部分はディレクトリ名に応じて変更します。
WORKDIR /kaguz
COPY Gemfile /kaguz/Gemfile
COPY Gemfile.lock /kaguz/Gemfile.lock
RUN bundle install
COPY . /kaguz

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]