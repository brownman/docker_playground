arg1="$@"
msg0="'$( date +%H:%M )'"
msg="${arg1:-$msg0}"

echo 1 >> .old/.dirty
git add .


commander git commit -am  "'$msg'"

git push 

