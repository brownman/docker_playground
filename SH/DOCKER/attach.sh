str="$( docker ps   )"
echo -e "$str"  > /tmp/1


cat /tmp/1 

echo attach to :
#echo -n 'docker attach '
num=$( cat /tmp/1 | tail -n +2 | grep onbuild | awk '{print $1}' )
commander docker attach $num
