str="$( docker ps | awk '{print $1}' |  tail -n +2 )"
echo "str: $str"
for item in $str;do
commander "docker kill $item"
done

