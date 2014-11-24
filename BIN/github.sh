source ~/config.cfg    
git config --global user.name $username
    git config --global user.email $email

echo After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

