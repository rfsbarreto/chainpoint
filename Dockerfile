# syntax=docker/dockerfile:1
FROM ruby:2.7

# update yarn repo
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# update system and install needed libs
RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client


WORKDIR /chainpoint
COPY Gemfile /chainpoint/Gemfile
COPY Gemfile.lock /chainpoint/Gemfile.lock


# setup gems and json libs
RUN bundle install
COPY package.json yarn.lock ./

RUN yarn install --check-files

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
