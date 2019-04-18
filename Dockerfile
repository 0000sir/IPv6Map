FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /opt/www
WORKDIR /opt/www
COPY Gemfile /opt/www/Gemfile
RUN bundle install
# then run docker run --rm --name create_rails_app -v ${PWD}:/opt/www ipv6map_www rails new -B /opt/www if you're creating app
ADD . /opt/www
EXPOSE 3000
WORKDIR /opt/www
CMD ["/opt/www/start.sh"]