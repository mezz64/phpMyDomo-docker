FROM eboraas/apache:jessie
MAINTAINER Ed Boraas <ed@boraas.ca>

RUN apt-get update && apt-get -y install php5 php5-curl git && apt-get clean

#Enable mod-rewrite
RUN a2enmod rewrite

RUN mkdir /opt/phpMyDomo
RUN git clone https://github.com/phpMyDomo/phpMyDomo.git /opt/phpMyDomo

#RUN chmod 755 /var/www/phpMyDomo/www/inc/bin/install_debian.sh
#RUN ./install_debian.sh

#RUN chmod -R 777 /var/www/phpMyDomo/www/inc/cache

#RUN mv -f /home/USERNAME/phpMyDomo-phpMyDomo-XXXX/www/* /var/www/ 
#RUN mv -f /home/USERNAME/phpMyDomo-phpMyDomo-XXXX/www/.htaccess /var/www/

#RUN apache2ctl restart

#Expose www volume
#VOLUME /var/www

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
