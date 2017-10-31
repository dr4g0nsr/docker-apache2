FROM ubuntu:16.04

MAINTAINER Dragutin Cirkovic (dragonmen@gmail.com)

# install dependencies
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		apache2 \
		libapache2-mod-fcgid \
		telnet \
		iputils-ping \
		nano

# modules
RUN a2enmod mpm_event rewrite suexec include fcgid proxy proxy_fcgi alias

# source lists
RUN rm -r /var/lib/apt/lists/*

RUN rm /etc/apache2/sites-enabled/000-default.conf
RUN rm /etc/apache2/sites-available/000-default.conf

COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY apache2.conf /etc/apache2/apache2.conf
COPY fcgid.conf /etc/apache2/fcgid.conf
COPY apache-run /usr/sbin/apache-run

RUN chmod 777 /usr/sbin/apache-run

# Mount volume
VOLUME /var/www/html
VOLUME /etc/apache2/sites-enabled

# Ports
EXPOSE 80

# Default command	
CMD ["apache-run"]

# Debug
#CMD ["bash"]