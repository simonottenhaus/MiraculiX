# MiraculiX

You should clone this into your armarx folder under the name "MiraculiX".  
Create config.user.rc next to config.rc to fit your setup. Make sure you source the _setupAliases file in your .bashrc as well ("source \<path-to-miraculix\>/_setupAliases.sh").  
Take a look at _aliases/aliases.sh for available aliases.  

Some basic commands:
- start/stop or run/halt: start/stop ice and mongodb
- gitall, makeall: execute git/make on all projects
- sa/so/re: start/stop/rerun scenario
- armarx_tests_disable: disable all tests (speed up compile time); NOTE: you no longer have to reenable tests in VisionX
- armarx_versioncheck_disable: disable version checking
- gui/guikill: start the gui or kill it when it's being tenacious

Some more interesting commands:
- p \<arg\>: is case insensitive and cd's to the first project that contains \<arg\> or armarx\<arg\>, e.g. "p c" brings you to ArmarXCore, "p s" to ArmarXSimulation, etc
- sc \<arg\>: is case insensitive and cd's to the first scenario that begins with \<arg\>
- inp \<args\>: execute args within current project folder

'inp' is mostly used to cmake ('cmk') or make ('mk') the project when you're in some subfolder, e.g. some scenario.

Use 'git_reset_clean' and 'git_stash_and_drop' only when you're sufficently desperate.

"p" and "sc" also support tab-completion thanks to https://github.com/Indidev
