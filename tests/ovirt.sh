./kill.sh
test $# -eq 0 && (
commander docker run -d -v /etc/ovirt-engine -v /etc/sysconfig/ovirt-engine \
        -v /etc/exports.d -v /etc/pki/ovirt-engine/ -v /var/log/ovirt-engine \
            --name ovirt-data mgoldboi/ovirt-engine-3.5.0
) || (
commander docker run -d -v /var/lib/pgsql/data --name ovirt-db-data mgoldboi/ovirt-db-3.5.0

commander docker run --name ovirt-db -d --volumes-from ovirt-db-data mgoldboi/ovirt-db-3.5.0

commander docker run --privileged -dt -p 80:80 -p 443:443 --link ovirt-db:ovirt-db \
    --name ovirt --volumes-from ovirt-db-data mgoldboi/ovirt-engine-3.5.0
)
