
FROM ubuntu:20.04 

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apache2 php git

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN rm -rf /var/www/html/*
RUN git clone https://gist.github.com/xxsanekxx/4371331.git /var/www/html/

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
