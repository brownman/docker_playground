docker run -d \
-p 80:80 \
-v /srv/openstack/horizon/dashboard:/etc/openstack-dashboard \
--name horizon --hostname horizon \
--link keystone:keystone \
cosmicq/openstack-horizon
