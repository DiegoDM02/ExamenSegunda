#Instalamos Apache y php
RUN apt-get update && apt-get install -y apache2 php git curl && apt-get clean

#Iniciamos apache y descargamos la aplicacion
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN rm -rf /var/www/html/*
RUN git clone https://github.com/andrezrv/wp-random-cats/blob/master/random-cat.php /var/www/html/

#Exponemos php en el puerto 80
EXPOSE 80
#Y por ultimo ejecución de apache en segundo plano
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
