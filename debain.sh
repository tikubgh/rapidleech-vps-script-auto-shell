rm setup.sh
cat > setup.sh << 'EOF'
#!/bin/bash
set -e

# Debian 13 RapidLeech setup

apt update && \
apt install -y apache2 php libapache2-mod-php php-curl php-zip unzip wget unrar-free && \
a2enmod rewrite && \
systemctl restart apache2 && \
mkdir -p /var/www/html/rapid && \
cd /var/www/html/rapid && \
rm -rf * .??* && \
wget https://github.com/Th3-822/rapidleech/archive/refs/heads/master.zip && \
unzip master.zip && \
mv rapidleech-master/* . && \
rm -rf rapidleech-master master.zip && \
chown -R www-data:www-data /var/www/html/rapid && \
chmod -R 755 /var/www/html/rapid && \
mkdir -p files && \
chown www-data:www-data files && \
chmod 777 files && \
systemctl restart apache2
EOF
bash setup.sh
