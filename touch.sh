source source.cfg
arg1="$@"
msg0="'$( date +%H:%M )'"
msg="${arg1:-$msg0}"

echo 1 >> .old/.dirty
git add -A


commander git commit -am  "'$msg'"

git push 

