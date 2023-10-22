# Use the official Ruby image as a base image
FROM ruby:3.1.4

# Update the package manager and install necessary dependencies
RUN apt-get update -qq && apt-get install -y \
    nodejs \
    postgresql-client \
    imagemagick

# Set the working directory within the container
WORKDIR /kaguz

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile /kaguz/Gemfile
COPY Gemfile.lock /kaguz/Gemfile.lock

# Install Bundler and update RubyGems
RUN gem install bundler
RUN gem update --system

# Copy the entire application into the container
COPY . /kaguz

# Install the application's gems
RUN bundle install

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Specify the script to run when the container starts
ENTRYPOINT ["entrypoint.sh"]

# Expose the port on which the application will run
EXPOSE 3000

# Start the Rails server
# CMD ["rails", "server", "-b", "0.0.0.0"]


