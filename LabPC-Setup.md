# LabPC Setup
Setup Git:
```
git config --global user.name "Your Full Name"
git config --global user.email your.email@domain.example

git config --global credential.helper cache
```

Create directories and clone MiraculiX, ArmarX and build. This takes up to 40 minutes (8 core PC) or > 1 h (4 Core PC):
```
cd ~/home
mkdir armarx
cd armarx
git clone https://github.com/simonottenhaus/MiraculiX.git
MiraculiX/_tools/clone.sh # This needs access to the h2t repositories. Get a redmine account first!
MiraculiX/makeall.sh
```

Enable aliases:
```
# Add this line to your ~/.bashrc
source ~/home/armarx/MiraculiX/_setupAliases.sh
```
