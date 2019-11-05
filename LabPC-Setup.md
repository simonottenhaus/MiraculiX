# LabPC Setup
Setup Git:
```
git config --global user.name "Your Full Name"
git config --global user.email your.email@domain.example

git config --global credential.helper cache
```

Create directories and clone MiraculiX, ArmarX. 
```
mkdir repos
cd repos
git clone https://github.com/simonottenhaus/MiraculiX.git
MiraculiX/_tools/clone.sh # This needs access to the h2t repositories. Get a redmine account first!
```

Setup your own local Simox (optional but highly recommended!)
```
cd ~/repos/Simox/build
cmake .. -DCMAKE_BUILD_TYPE=Release -DSimox_BUILD_SimDynamics=on -DSimDynamics_USE_BULLET_DOUBLE_PRECISION=on
make -j8
echo "export Simox_DIR=`pwd`" >> ~/.bashrc
```

Setup your own local IVT
```
cd ~/repos/IVT/build
cmake ..
make -j8
echo "export IVT_DIR=`pwd`" >> ~/.bashrc
```

Setup your own local MMMCore
```
mkdir ~/repos/MMMCore/build
cd ~/repos/MMMCore/build
cmake ..
make -j8
echo "export MMMCore_DIR=`pwd`" >> ~/.bashrc
```

Enable aliases (optional):
```
# Add alias setup to .bashrc
echo "source ~/repos/MiraculiX/_setupAliases.sh" >> ~/.bashrc

# Reload .bashrc
. ~/.bashrc
```

Build ArmarX. This takes up to 1h (8 core PC) or > 2 h (4 Core PC):
```
# Reload .bashrc
. ~/.bashrc

cd  ~/repos
MiraculiX/makeall.sh
```


Initial run:
```
start
memimport
stop
```

Edit ~/.armarx/default.cfg:
- Change the port number for ice
- Change the port number for MongoDB
```
# Edit ~/.armarx/default.cfg
Ice.Default.Locator=IceGrid/Locator:tcp -p UNIQUE_ICE_PORT_HERE -h localhost
IceGrid.Registry.Client.Endpoints=tcp -p UNIQUE_ICE_PORT_HERE
IceStormAdmin.TopicManager.Default=IceStorm/TopicManager

ArmarX.MongoHost=localhost
ArmarX.MongoPort=UNIQUE_MONGODB_PORT_HERE
```
