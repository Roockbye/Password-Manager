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