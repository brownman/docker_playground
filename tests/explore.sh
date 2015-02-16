#dir_home=$HOME
test -v dir_home
test -v dir_project

dir_self=$( dirname $0 ) 
echo "dir_self: $dir_self "
list=$( find $dir_project -type f | grep '.json$' )

echo list: $list
func1(){
    local file cmd
for item in $list;do
 file="$item"
test -f $file || { echo "[err] not a file: $file"; exit 1; }
 cmd="$file_runner $file"
#echo "[cmd] $cmd"
#eval "$cmd"
commander "$cmd"
done
}
func1
