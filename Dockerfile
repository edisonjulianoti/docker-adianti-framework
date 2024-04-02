# Use the official Ubuntu 20.04 image as base
FROM ubuntu:20.04

# Atualizar pacotes e instalar Apache, PHP 7.4 e PostgreSQL 12
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 \
    php7.4 \
    libapache2-mod-php7.4 \
    php7.4-soap \
    php7.4-xml \
    php7.4-curl \
    php7.4-opcache \
    php7.4-gd \
    php7.4-sqlite3 \
    php7.4-mbstring \
    php7.4-pgsql \
    php7.4-mysql \
    postgresql-12 \
    postgresql-client \
    rpl \
    zip \
    unzip \
    git \
    vim \
    curl

# Habilitar mod_rewrite no Apache
RUN a2enmod rewrite

# Configurar algumas diretivas do PHP
RUN echo "error_log = /tmp/php_errors.log" >> /etc/php/7.4/apache2/php.ini && \
    echo "display_errors = On" >> /etc/php/7.4/apache2/php.ini && \
    echo "memory_limit = 256M" >> /etc/php/7.4/apache2/php.ini && \
    echo "max_execution_time = 120" >> /etc/php/7.4/apache2/php.ini && \
    echo "error_reporting = E_ALL" >> /etc/php/7.4/apache2/php.ini && \
    echo "file_uploads = On" >> /etc/php/7.4/apache2/php.ini && \
    echo "post_max_size = 100M" >> /etc/php/7.4/apache2/php.ini && \
    echo "upload_max_filesize = 100M" >> /etc/php/7.4/apache2/php.ini && \
    echo "session.gc_maxlifetime = 14000" >> /etc/php/7.4/apache2/php.ini && \
    echo "display_errors = Off" >> /etc/php/7.4/apache2/php.ini && \
    echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE" >> /etc/php/7.4/apache2/php.ini

# Ajustar configurações de segurança para as sessões PHP
RUN echo "session.name = CUSTOMSESSID" >> /etc/php/7.4/apache2/php.ini && \
    echo "session.use_only_cookies = 1" >> /etc/php/7.4/apache2/php.ini && \
    echo "session.cookie_httponly = true" >> /etc/php/7.4/apache2/php.ini && \
    echo "session.use_trans_sid = 0" >> /etc/php/7.4/apache2/php.ini && \
    echo "session.entropy_file = /dev/urandom" >> /etc/php/7.4/apache2/php.ini && \
    echo "session.entropy_length = 32" >> /etc/php/7.4/apache2/php.ini

# Reiniciar Apache
CMD ["apachectl", "-D", "FOREGROUND"]
