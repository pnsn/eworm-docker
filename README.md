#eworm-docker
A simple docker container for earthworm
##Usage 

<code>./ew_containerize</code>
This script will do the following: 
1.Mount the current $dir/params to the ew params dir, which will put your local files into the ew params directory.
2.Start an interactive shell and put you in the mounted params dir

Next run the startstop script in the params dir
<code>startstop.sh</code>

##Configuration
Add any configure files from /eworm/earthworm_[version]/params to /eworm/run/params

##Issues
Using startstop as an entrypoint does not work since the child processes don't run.

