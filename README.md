**My dotfile**

#Initial
```
sudo apt-get install ssh git 
```

#Create ssh-key
```
ssh-keygen -t ecdsa -N "" -f github_ecdsa
echo "Host github \n    HostName github.com\n    User git\n    IdentityFile ~/.ssh/github_ecdsa" >> ~/.ssh/config
```

#Install
```
git clone git:github.com:hightoro/dotfiles ~/.dotfiles  
```

#Dotfiles
+bash  
+emacs  
+tmux  
+vim  
+zsh  

