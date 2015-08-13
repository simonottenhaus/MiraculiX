# MiraculiX

Changes:
- allgit -> gitall
- pullall -> gitall pull

You should clone this into your armarx folder under the name "MiraculiX".
Edit setupScripts to fit your setup. Make sure you source the setupScripts file in your .bashrc as well ("source \<path-to-miraculix\>/setupScripts.sh").
Take a look at aliases.sh for available aliases.

Some basic commands:
- start/stop: start/stop ice and mongodb
- gitall, makeall: execute git/make on all projects
- sa/so/re: start/stop/rerun scenario
- armarx_tests_disable: disable all tests (speed up compile time); will have to re-enable tests in VisionX since it won't compile without
- armarx_versioncheck_disable: disable version checking
- gui/guikill: start the gui or kill it when it's being tenacious

Some more interesting commands:
- p \<arg\>: is case insensitive and cd's to the first project that begins with \<arg\>, e.g. "p c" brings you to Core, "p s" to SimulatioX, etc
- sc \<arg\>: is case insensitive and cd's to the first scenario that begins with \<arg\>
- inp \<args\>: execute args within current project folder

'inp' is mostly used to cmake ('cmk') or make ('mk') the project when you're in some subfolder, e.g. some scenario.

Use 'git_reset_clean' and 'git_stash_and_drop' only when you're sufficently desperate.
