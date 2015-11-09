
cp_to_container(){
local file_src=$1
local file_dest=$2

commander "docker exec -i $alias_gitbook /bin/bash -c 'cat > $file_dest' < $file_src"
commander "docker exec $alias_gitbook /bin/bash -c 'chmod +x $file_dest'"
}



create_file(){
cat >/tmp/cmd_gitbook <<START
ls -laR $dir $dir1
cd $dir 
gitbook build . /tmp
#/srv/html;
ls -laR $dir1

START

}


struct1(){
dir=/srv/gitbook
dir1=/srv/html
mkdir -p $dir
file=$dir/README.md
echo -e "hello world\n------" > $file
ls $dir -la 
alias_gitbook=alias_gitbook
}

steps(){
source source.cfg
struct1

commander create_file

commander_try docker stop $alias_gitbook
commander_try docker rm $alias_gitbook
commander docker run -d -p 4000:4000 -p 32768:32768 --name=$alias_gitbook -v /srv/gitbook:/srv/gitbook -v /srv/html:/srv/html  fellah/gitbook
commander cp_to_container /tmp/cmd_gitbook /tmp/gitbook.sh
commander docker exec $alias_gitbook bash -c /tmp/gitbook.sh
}

steps
