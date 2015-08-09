str="$( docker ps   )"
echo -e "$str"  > /tmp/1


cat /tmp/1 

echo attach to :
#echo -n 'docker attach '
#num=$( cat /tmp/1 | tail -n +2 | grep onbuild | awk '{print $1}' )
cat /tmp/1 | tail -n +2 | grep -v onbuild | awk '{print $1}' > /tmp/2
cat -n /tmp/2

while read line;do
    commander docker attach $line &
    echo $! >> /tmp/pids
done < /tmp/2

cat /tmp/pids



