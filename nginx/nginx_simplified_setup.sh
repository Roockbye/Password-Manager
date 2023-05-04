tar -czvf /srv/nginx.old_$(date +'%F_%H-%M-%S').tar.gz /etc/nginx/ /usr/share/nginx/html/

curl -L -O https://github.com/Melanieynov/Password-Manager/archive/refs/heads/main.zip && unzip main.zip

mv Password-Manager-main/nginx/etc/nginx/conf.d/ /etc/nginx/conf.d/
mv Password-Manager-main/nginx/etc/nginx/sites-enabled/ /etc/nginx/sites-enabled/
mv Password-Manager-main/nginx/etc/nginx/nginx.conf /etc/nginx/nginx.conf

mv Password-Manager-main/nginx/usr/share/nginx/html/ /usr/share/nginx/html/

find /etc/nginx/  -exec chown nginx:nginx {} \;
find /etc/nginx/ -type d  -exec chmod 500 {} \;
find /etc/nginx/ -type f  -exec chmod 400 {} \;

find /usr/share/nginx/  -exec chown nginx:nginx {} \;
find /usr/share/nginx/ -type f  -exec chmod 400 {} \;
find /usr/share/nginx/ -type d  -exec chmod 500 {} \;

rm -rf main.zip
rm -rf Password-Manager-main

tar -czvf /srv/nginx_$(date +'%F_%H-%M-%S').tar.gz /etc/nginx/ /usr/share/nginx/html/


firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=443/tcp --permanent

firewall-cmd --add-icmp-block=redirect --permanent

firewall-cmd --add-rich-rule='rule family=ipv4 protocol value="icmp" limit value="10/s" accept' --permanent

firewall-cmd --remove-service=cockpit --permanent
firewall-cmd --remove-service=dhcpv6-client --permanent
firewall-cmd --remove-service=mdns --permanent

firewall-cmd --reload && firewall-cmd --list-all