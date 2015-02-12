str=$( docker ps | awk '{print $11}' | grep sel )
echo $str

