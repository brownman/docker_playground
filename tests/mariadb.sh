docker run -d \
-p 8080:80 \
-e INITIALIZE=yes \
--name mariadb --hostname mariadb \
cosmicq/openstack-mariadb
