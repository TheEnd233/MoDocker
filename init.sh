#!/bin/bash
usermod -s /bin/bash www-data
chown -R  www-data:www-data /var/www
php /cldata/init.php
#chmod -R 777 /var/www
a2enmod http2 ssl php7.0
a2ensite default-ssl
sed -i 's/SSLEngine\ on/SSLEngine\ on\nProtocolsHonorOrder\ On\nProtocols\ h2\ http\/1.1/g' /etc/apache2/sites-enabled/default-ssl.conf

service apache2 start
su -c '/usr/bin/aria2c --conf-path=/cldata/aria2.conf' www-data