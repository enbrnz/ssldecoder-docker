FROM ubuntu:20.04

LABEL maintainer="eneubauer@owncloud.com"
LABEL version="0.1"
LABEL description="This is a Docker Image for github.com/enbrnz/ssl-decoder"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -q &&\
	DEBIAN_FRONTEND=noninteractive apt-get install -yq git apache2 php php-intl php-bcmath php-curl php-mbstring php-xml &&\
	rm -rf /var/lib/apt/lists/* &&\
	apt-get clean

RUN rm -rf /var/www/html &&\
	git clone https://github.com/enbrnz/ssl-decoder.git /var/www/html &&\
	chown www-data /var/www/html/results &&\
	sed -i "s/,shell_exec,/,/g" /etc/php/7.4/apache2/php.ini

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]