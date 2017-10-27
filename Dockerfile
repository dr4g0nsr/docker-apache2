FROM ubuntu:16.04
MAINTAINER Dragutin Cirkovic (dragonmen@gmail.com)

# install dependencies
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		apache2 \
		libapache2-mod-fcgid \
		nano

# modules
RUN a2enmod rewrite && a2enmod suexec && a2enmod include && a2enmod fcgid && a2enmod proxy proxy_fcgi

# source lists
RUN rm -r /var/lib/apt/lists/*

COPY 001-site.conf /etc/apache2/sites-enabled/001-site.conf
COPY apache2.conf /etc/apache2/apache2.conf

RUN rm /etc/apache2/sites-enabled/000-default.conf
RUN rm /etc/apache2/sites-available/000-default.conf

# Mount volume
VOLUME /var/www/html

# Ports
EXPOSE 80

# Default command	
CMD ["apachectl", "-D", "FOREGROUND"]