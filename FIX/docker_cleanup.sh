service docker stop
rm -rf /var/lib/docker/containers/*
rm -rf /var/lib/docker/vfs/dir/*
service docker start
