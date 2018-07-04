# LabPC Setup
Setup Git:
```
git config --global user.name "Your Full Name"
git config --global user.email your.email@domain.example

git config --global credential.helper cache
```

Create directories and clone MiraculiX, ArmarX. 
```
mkdir armarx
cd armarx
git clone https://github.com/simonottenhaus/MiraculiX.git
MiraculiX/_tools/clone.sh # This needs access to the h2t repositories. Get a redmine account first!
```

Setup your own local Simox (optional but highly recommended!)
```
cd ~/armarx/Simox/build
cmake .. -DCMAKE_BUILD_TYPE=Release -DSimox_BUILD_SimDynamics=on -DSimDynamics_USE_BULLET_DOUBLE_PRECISION=on
make -j8
echo "export Simox_DIR=`pwd`" >> ~/.bashrc
```

Build ArmarX. This takes up to 1h (8 core PC) or > 2 h (4 Core PC):
```
cd  ~/armarx
MiraculiX/makeall.sh
```

Enable aliases:
```
# Add alias setup to .bashrc
echo "source ~/armarx/MiraculiX/_setupAliases.sh" >> ~/.bashrc

# Reload .bashrc
. ~/.bashrc
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
