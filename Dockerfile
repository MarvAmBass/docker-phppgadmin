FROM marvambass/apache2-ssl-secure:latest

RUN apt-get -q -y update && \
    apt-get -q -y install php-pgsql \
                          php-mbstring \
                          wget && \
    apt-get -q -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    \
    rm -rf /var/www/html/* && \
    cd /var/www/html && \
    wget -O - https://github.com/phppgadmin/phppgadmin/releases/download/REL_7-13-0/phpPgAdmin-7.13.0.tar.gz | tar xzvf - && \
    mv php* phppgadmin && \
    chown -R www-data:www-data /var/www/html/phppgadmin && \
    chmod 660 /var/www/html/phppgadmin/conf/config.inc.php

COPY config/www/index.php /var/www/html/index.php
COPY config/runit/phppgadmin /container/config/runit/phppgadmin

COPY . /container-2