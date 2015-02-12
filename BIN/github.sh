#source ~/config.cfg    
git config --local user.name $username
git config --local user.email $email

echo After doing this, you may fix the identity used for this commit with:

    echo git commit --amend --reset-author

