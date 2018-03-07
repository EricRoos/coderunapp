# Dockerfile

# === 1 ===
FROM phusion/passenger-ruby25:0.9.29
MAINTAINER Jeroen van Baarsen "jeroen@firmhouse.com"

RUN apt-get update
RUN apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x nodejs qtdeclarative5-dev g++ xvfb
RUN gem update --system
# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# === 2 ===
# Start Nginx / Passenger
RUN rm -f /etc/service/nginx/down

# === 3 ====
# Remove the default site
RUN rm /etc/nginx/sites-enabled/default
# Add the nginx info
ADD nginx.conf /etc/nginx/sites-enabled/webapp.conf
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

# === 4 ===
# Prepare folders
RUN mkdir /home/app/webapp

# === 5 ===
# Run Bundle in a cache efficient way
WORKDIR /tmp  
ADD Gemfile /tmp/  
ADD Gemfile.lock /tmp/  
RUN bundle install

# === 6 ===
# Add the rails app
ADD . /home/app/webapp
WORKDIR /home/app/webapp
RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:precompile

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  
