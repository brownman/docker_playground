docker run -d \
-p 80:80 \
--name horizon --hostname horizon \
--link keystone:keystone \
cosmicq/openstack-horizon
