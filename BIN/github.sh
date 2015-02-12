set -u
echo msg is: 
msg="$@"
echo msg: $msg
source ../config.cfg    
git config --local user.name $username
git config --local user.email $email
git add .
git commit  -am "'$@'"
#echo After doing this, you may fix the identity used for this commit with:

#    git commit --amend --reset-author

