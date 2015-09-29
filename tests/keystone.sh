docker run -d \
--link mariadb:mariadb \
--name keystone \
cosmicq/openstack-keystone
