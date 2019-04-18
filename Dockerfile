FROM ruby:2.6.3
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list #&& sed -i 's|security.debian.org|mirrors.ustc.edu.cn|g' /etc/apt/sources.list
RUN apt-get update -qq && apt-get install -y nodejs cron
RUN mkdir /opt/www
WORKDIR /opt/www
COPY Gemfile /opt/www/Gemfile
RUN bundle install
# then run docker run --rm --name create_rails_app -v ${PWD}:/opt/www ipv6map_www rails new -B /opt/www if you're creating app
ADD . /opt/www
EXPOSE 3000
WORKDIR /opt/www
RUN printenv | sed 's/^\(.*\)$/export \1/g' > /etc/profile.d/rails_env.sh
RUN whenever --update-crontab
CMD ["/opt/www/start.sh"]