# MiraculiX

MiraculiX aims to help ArmarX developers to cope with daily tasks such as checking the git status on all repos or updating / compiling all projects. MiraculiX is an inofficial extension toolkit to use with ArmarX. Nevertheless it is well-maintained. If you find any bugs or have feature requestst please do not hesitate to contact me at simon (dot) ottenhaus (at) kit (dot) edu.

## Fast setup on H2T LabPCs
Please read and follow the [LabPC Setup](https://github.com/simonottenhaus/MiraculiX/blob/master/LabPC-Setup.md) if you are working at H2T at a LabPC.

## General notes
You should clone this into your armarx folder under the name "MiraculiX".  
Use config.user.rc next to config.rc to fit your setup. 
Make sure you source the _setupAliases file in your .bashrc as well ("source \<path-to-miraculix\>/_setupAliases.sh").  
Take a look at _aliases/aliases.sh for available aliases, or type in "alias" in the command line.
You can override the default aliases with something else or write your own in the _aliases.user.sh file.

You can and should use MiraculiX in parallel with the official ArmarX tools.

## Basic commands
- **start/stop** or run/halt: start/stop ice and mongodb
- **status**: show git status for all projects
- **MiraculiX/pullall.sh**: pull all projects
- **makeall**: make all projects
- **sa/so/re**: start/stop/rerun scenario
- **p \<arg\>**: jump to an ArmarX project. 'p' is case insensitive and cd's to the first project that contains \<arg\> or armarx\<arg\>, e.g. "p c" brings you to ArmarXCore, "p s" to ArmarXSimulation, etc
- **pb \<arg\>**: jump to the build directory of an ArmarX project.
- **sc \<arg\>**: jump to a scenario. 'sc' is case insensitive and cd's to the first scenario that begins, or contains (in that priority) with \<arg\>
- **gui/guikill**: start the gui or kill it when it's being tenacious
- **memexport/memimport**: export/import the database (make sure you've checked out the ArmarXDB project)
- **feierabend**: kill all ArmarX components, stop ice/mongodb, and log out.
- **newclass** \<ClassName\>: create ClassName.h and ClassName.cpp with class definition, shared pointer and include guard. To create a component please use the 'armarx-package' tool.

## Advanced commands
- **cmk**: rum 'cmake ..' in the current project build dir
- **mk**: run 'make' in the current project build dir
- **gitall/allgit \<args\>**: execute a git command in all projects, e.g. allgit status is simular to the status command
- **cmdall \<args\>**: execute a command in all projects, e.g. 'cmdall ls' will execute 'ls' in all projects.
- **armarx_tests_disable**: disable all tests (speed up compile time); NOTE: you no longer have to reenable tests in VisionX
- **armarx_versioncheck_disable**: disable version checking
- **inp \<args\>**: execute args within current project folder, 
'inp' is mostly used to cmake ('cmk') or make ('mk') the project when you're in some subfolder, e.g. some scenario.
- Use 'git_reset_clean' and 'git_stash_and_drop' only when you're sufficently desperate.
- "p" and "sc" also support tab-completion thanks to https://github.com/Indidev
